package com.mtf.artixel.service;

import com.mtf.artixel.mapper.InquiryMapper;
import com.mtf.artixel.vo.InquiryVO;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.util.List;
import java.util.UUID;

@Slf4j
@Service
@RequiredArgsConstructor
public class InquiryService {

    private final InquiryMapper inquiryMapper;

    // WebConfig.java에 설정하셨던 실제 Cafe24 서버의 물리적 업로드 경로입니다.
    private final String UPLOAD_DIR = "/artixel/tomcat/webapps/uploads/";

    // 1. 사용자: 문의 및 의뢰 접수 (파일 업로드 및 스팸 방지 IP 체크 포함)
    @Transactional(rollbackFor = Exception.class)
    public String insertInquiry(InquiryVO inquiryVO, MultipartFile file, String clientIp) throws Exception {

        // 스팸 방지: 1분 이내 동일 IP로 3회 이상 작성했는지 검사 (스토리보드 정책)
        int recentCount = inquiryMapper.selectRecentInquiryCountByIp(clientIp);
        if (recentCount >= 3) {
            log.warn("스팸 차단됨 - IP: {}", clientIp);
            return "SPAM_BLOCKED";
        }

        // 첨부 파일이 존재할 경우 파일 업로드 처리
        if (file != null && !file.isEmpty()) {
            // 저장할 디렉토리가 없으면 자동 생성
            File dir = new File(UPLOAD_DIR);
            if (!dir.exists()) {
                dir.mkdirs();
            }

            String originalFileName = file.getOriginalFilename();
            String extension = "";
            if (originalFileName != null && originalFileName.lastIndexOf(".") > -1) {
                extension = originalFileName.substring(originalFileName.lastIndexOf("."));
            }

            // 중복 방지를 위해 고유한 UUID로 새 파일명 생성
            String savedFileName = UUID.randomUUID().toString() + extension;
            File targetFile = new File(UPLOAD_DIR + savedFileName);

            // 서버의 지정된 경로로 물리적 파일 전송 및 저장
            file.transferTo(targetFile);

            // DB에 저장할 원본 파일명과 저장된 파일명 세팅
            inquiryVO.setFileOriginName(originalFileName);
            inquiryVO.setFilePath(savedFileName);
        }

        // 작성자 디바이스 IP 세팅
        inquiryVO.setClientIp(clientIp);

        // DB에 문의 내역 INSERT
        int result = inquiryMapper.insertInquiry(inquiryVO);

        if (result > 0) {
            // 차후 이곳에 자동 이메일 발송 로직(business@meetingfan.com 등)을 추가할 예정입니다.
            return "SUCCESS";
        }

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
}