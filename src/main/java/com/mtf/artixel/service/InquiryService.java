package com.mtf.artixel.service;

import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.model.CannedAccessControlList;
import com.amazonaws.services.s3.model.ObjectMetadata;
import com.amazonaws.services.s3.model.PutObjectRequest;
import com.mtf.artixel.mapper.InquiryMapper;
import com.mtf.artixel.vo.InquiryVO;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.InputStream;
import java.util.List;
import java.util.Map;
import java.util.UUID;

@Slf4j
@Service
@RequiredArgsConstructor
public class InquiryService {

    private final InquiryMapper inquiryMapper;
    private final AmazonS3 amazonS3;

    @Value("${naver.cloud.bucket}")
    private String bucketName;

    // 1. 사용자: 문의 및 의뢰 접수 (파일 업로드 및 스팸 방지 IP 체크 포함)
    @Transactional(rollbackFor = Exception.class)
    public String insertInquiry(InquiryVO inquiryVO, MultipartFile file, String clientIp) throws Exception {

        // 스팸 방지: 1분 이내 동일 IP로 3회 이상 작성했는지 검사 (스토리보드 정책)
        int recentCount = inquiryMapper.selectRecentInquiryCountByIp(clientIp);
        if (recentCount >= 3) {
            log.warn("스팸 차단됨 - IP: {}", clientIp);
            return "SPAM_BLOCKED";
        }

        // 첨부 파일이 존재할 경우 네이버 클라우드 Object Storage에 업로드 처리
        if (file != null && !file.isEmpty()) {
            String originalFileName = file.getOriginalFilename();
            String extension = "";
            if (originalFileName != null && originalFileName.lastIndexOf(".") > -1) {
                extension = originalFileName.substring(originalFileName.lastIndexOf("."));
            }

            // 중복 방지를 위해 고유한 UUID로 새 파일명 생성
            String savedFileName = UUID.randomUUID().toString() + extension;

            // 파일 메타데이터 설정 (사이즈와 확장자 정보)
            ObjectMetadata metadata = new ObjectMetadata();
            metadata.setContentType(file.getContentType());
            metadata.setContentLength(file.getSize());

            // InputStream을 통해 서버 메모리를 최소화하며 클라우드로 직접 전송
            try (InputStream inputStream = file.getInputStream()) {
                PutObjectRequest putObjectRequest = new PutObjectRequest(bucketName, savedFileName, inputStream, metadata);

                // 관리자가 웹에서 이미지를 바로 볼 수 있도록 읽기 권한 부여
                putObjectRequest.withCannedAcl(CannedAccessControlList.PublicRead);
                amazonS3.putObject(putObjectRequest);
            }

            // 네이버 클라우드에 업로드된 실제 이미지 접근 URL 가져오기
            String fileUrl = amazonS3.getUrl(bucketName, savedFileName).toString();

            // DB에 저장할 원본 파일명, 저장된 파일명, 클라우드 URL 세팅
            inquiryVO.setFileOriginName(originalFileName);
            inquiryVO.setFilePath(savedFileName);
            inquiryVO.setFileUrl(fileUrl);

        } else if (inquiryVO.getFileUrl() != null && !inquiryVO.getFileUrl().isEmpty()) {
            // 사용자가 이미지가 아닌 타 드라이브 URL 링크만 남긴 경우
            inquiryVO.setFileOriginName("URL_LINK");
            inquiryVO.setFilePath("URL_LINK");
        }

        // 작성자 디바이스 IP 세팅
        inquiryVO.setClientIp(clientIp);

        // DB에 문의 내역 INSERT
        int result = inquiryMapper.insertInquiry(inquiryVO);
        if (result > 0) return "SUCCESS";

        return "FAIL";
    }

    // 2. 관리자: 문의 목록 조회
    public List<InquiryVO> getInquiryList(InquiryVO inquiryVO) throws Exception {
        return inquiryMapper.selectInquiryList(inquiryVO);
    }

    // 3. 관리자: 문의 총 개수 (페이징용)
    public int getInquiryListCount(InquiryVO inquiryVO) throws Exception {
        return inquiryMapper.selectInquiryListCount(inquiryVO);
    }

    // 4. 관리자: 문의 상세 조회
    public InquiryVO getInquiryDetail(Long inquiryId) throws Exception {
        return inquiryMapper.selectInquiryDetail(inquiryId);
    }

    // 5. 관리자: 문의 삭제
    @Transactional(rollbackFor = Exception.class)
    public boolean deleteInquiry(Long inquiryId) throws Exception {
        return inquiryMapper.deleteInquiry(inquiryId) > 0;
    }

    // 6. 관리자: 문의 진행 상태 변경
    @Transactional(rollbackFor = Exception.class)
    public boolean updateInquiryStatus(InquiryVO inquiryVO) throws Exception {
        return inquiryMapper.updateInquiryStatus(inquiryVO) > 0;
    }

    // --- 대시보드 통계 조회용 메서드 ---
    public int getTotalInquiryCount() throws Exception {
        return inquiryMapper.selectTotalInquiryCount();
    }

    public int getTodayInquiryCount() throws Exception {
        return inquiryMapper.selectTodayInquiryCount();
    }

    public List<Map<String, Object>> getInquiryCountByCategory() throws Exception {
        return inquiryMapper.selectInquiryCountByCategory();
    }

    public List<Map<String, Object>> getInquiryCountByCountry() throws Exception {
        return inquiryMapper.selectInquiryCountByCountry();
    }

}