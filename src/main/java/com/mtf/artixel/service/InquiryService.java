package com.mtf.artixel.service;

import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.model.CannedAccessControlList;
import com.amazonaws.services.s3.model.ObjectMetadata;
import com.amazonaws.services.s3.model.PutObjectRequest;
import com.mtf.artixel.dto.MailRequestDTO;
import com.mtf.artixel.mapper.InquiryMapper;
import com.mtf.artixel.vo.InquiryVO;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import java.io.InputStream;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.UUID;

@Slf4j
@Service
@RequiredArgsConstructor
public class InquiryService {

    private final InquiryMapper inquiryMapper;
    private final AmazonS3 amazonS3;
    private final DirectSendService directSendService;

    @Value("${naver.cloud.bucket}")
    private String bucketName;

    @Transactional(rollbackFor = Exception.class)
    public String insertInquiry(InquiryVO inquiryVO, MultipartFile file, String clientIp) throws Exception {

        // 1. 스팸 방지 검사
        int recentCount = inquiryMapper.selectRecentInquiryCountByIp(clientIp);
        if (recentCount >= 3) {
            log.warn("스팸 차단됨 - IP: {}", clientIp);
            return "SPAM_BLOCKED";
        }

        // 2. 첨부파일 Naver Object Storage 업로드 (의뢰인별 폴더 자동 분류)
        if (file != null && !file.isEmpty()) {
            String originalFileName = file.getOriginalFilename();
            String extension = "";
            if (originalFileName != null && originalFileName.lastIndexOf(".") > -1) {
                extension = originalFileName.substring(originalFileName.lastIndexOf("."));
            }

            // 날짜와 의뢰인 이름을 활용한 폴더 경로 생성 (특수문자 제거)
            String dateStr = LocalDate.now().format(DateTimeFormatter.ofPattern("yyyyMMdd"));
            String safeName = inquiryVO.getClientName().replaceAll("[^a-zA-Z0-9가-힣]", "_");
            String folderPath = "inquiries/" + dateStr + "_" + safeName + "/";

            String savedFileName = folderPath + UUID.randomUUID().toString() + extension;

            ObjectMetadata metadata = new ObjectMetadata();
            metadata.setContentType(file.getContentType());
            metadata.setContentLength(file.getSize());

            try (InputStream inputStream = file.getInputStream()) {
                PutObjectRequest putObjectRequest = new PutObjectRequest(bucketName, savedFileName, inputStream, metadata);
                putObjectRequest.withCannedAcl(CannedAccessControlList.PublicRead);
                amazonS3.putObject(putObjectRequest);
            }

            String fileUrl = amazonS3.getUrl(bucketName, savedFileName).toString();
            inquiryVO.setFileOriginName(originalFileName);
            inquiryVO.setFilePath(savedFileName);
            inquiryVO.setFileUrl(fileUrl);

        } else if (inquiryVO.getFileUrl() != null && !inquiryVO.getFileUrl().isEmpty()) {
            inquiryVO.setFileOriginName("URL_LINK");
            inquiryVO.setFilePath("URL_LINK");
        }

        inquiryVO.setClientIp(clientIp);

        // 3. DB 저장
        int result = inquiryMapper.insertInquiry(inquiryVO);

        // 4. 관리자에게 신규 의뢰 알림 이메일 동시 발송
        if (result > 0) {
            try {
                MailRequestDTO mailReq = new MailRequestDTO();
                mailReq.setSubject("[Artixel] 홈페이지 신규 의뢰 접수 알림 (" + inquiryVO.getClientName() + ")");

                StringBuilder body = new StringBuilder();
                body.append("Artixel 홈페이지에 새로운 문의/의뢰가 접수되었습니다.<br><br>");
                body.append("■ 구분: ").append(inquiryVO.getCategory()).append("<br>");
                body.append("■ 의뢰인(기업명): ").append(inquiryVO.getClientName()).append("<br>");
                body.append("■ 연락처: ").append(inquiryVO.getCountryCode()).append(" ").append(inquiryVO.getContact()).append("<br>");
                body.append("■ 이메일: ").append(inquiryVO.getEmail()).append("<br>");
                body.append("■ 국가: ").append(inquiryVO.getCountry()).append("<br><br>");
                body.append("관리자 대시보드에서 상세 내용을 확인해주세요.<br>");
                body.append("▶ <a href='https://artixel.kr/mng/index.do' target='_blank'>https://artixel.kr/mng/index.do</a>");

                mailReq.setBody(body.toString());

                List<MailRequestDTO.Receiver> receivers = new ArrayList<>();

                MailRequestDTO.Receiver r1 = new MailRequestDTO.Receiver();
                r1.setEmail("business@meetingfan.com");
                receivers.add(r1);

                MailRequestDTO.Receiver r2 = new MailRequestDTO.Receiver();
                r2.setEmail("tax@meetingfan.com");
                receivers.add(r2);

                mailReq.setReceiver(receivers);

                // DirectSend API 호출
                directSendService.processMailSend(mailReq);

            } catch (Exception e) {
                log.error("관리자 알림 이메일 발송 실패", e);
            }
            return "SUCCESS";
        }

        return "FAIL";
    }

    public List<InquiryVO> getInquiryList(InquiryVO inquiryVO) throws Exception {
        return inquiryMapper.selectInquiryList(inquiryVO);
    }

    public int getInquiryListCount(InquiryVO inquiryVO) throws Exception {
        return inquiryMapper.selectInquiryListCount(inquiryVO);
    }

    public InquiryVO getInquiryDetail(Long inquiryId) throws Exception {
        return inquiryMapper.selectInquiryDetail(inquiryId);
    }

    @Transactional(rollbackFor = Exception.class)
    public boolean deleteInquiry(Long inquiryId) throws Exception {
        return inquiryMapper.deleteInquiry(inquiryId) > 0;
    }

    @Transactional(rollbackFor = Exception.class)
    public boolean updateInquiryStatus(InquiryVO inquiryVO) throws Exception {
        return inquiryMapper.updateInquiryStatus(inquiryVO) > 0;
    }

    // 대시보드 통계
    public int getTotalInquiryCount() throws Exception {
        return inquiryMapper.selectTotalInquiryCount();
    }

    public int getTodayInquiryCount() throws Exception {
        return inquiryMapper.selectTodayInquiryCount();
    }

    public int getTotalVisitors() throws Exception {
        return inquiryMapper.selectTotalVisitors();
    }

    public int getTotalUniqueVisitors() throws Exception {
        return inquiryMapper.selectTotalUniqueVisitors();
    }

    public List<Map<String, Object>> getVisitorTrend(String period) throws Exception {
        return inquiryMapper.selectVisitorTrend(period);
    }

    public List<Map<String, Object>> getInquiryTrendByCategory(String period) throws Exception {
        return inquiryMapper.selectInquiryTrendByCategory(period);
    }

    public List<Map<String, Object>> getCountryStat(String period) throws Exception {
        return inquiryMapper.selectCountryStat(period);
    }

    // 상위 페이지 조회수
    public List<Map<String, Object>> getTopPageViews() throws Exception {
        return inquiryMapper.selectTopPageViews();
    }

    // 페이지 조회수 증가
    @Transactional(rollbackFor = Exception.class)
    public void increasePageView(String pageUrl, String pageName) {
        try {
            inquiryMapper.upsertPageView(pageUrl, pageName);
        } catch (Exception e) {
            log.error("조회수 증가 실패: {}", pageUrl, e);
        }
    }

    // 방문자 로그 기록 (세션당 1회)
    @Transactional(rollbackFor = Exception.class)
    public void insertVisitLog(String clientIp) {
        try {
            inquiryMapper.insertVisitLog(clientIp);
        } catch (Exception e) {
            log.error("방문자 로그 기록 실패", e);
        }
    }

}