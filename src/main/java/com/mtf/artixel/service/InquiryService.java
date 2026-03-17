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

    @Transactional(rollbackFor = Exception.class)
    public String insertInquiry(InquiryVO inquiryVO, MultipartFile file, String clientIp) throws Exception {
        int recentCount = inquiryMapper.selectRecentInquiryCountByIp(clientIp);
        if (recentCount >= 3) {
            log.warn("스팸 차단됨 - IP: {}", clientIp);
            return "SPAM_BLOCKED";
        }

        if (file != null && !file.isEmpty()) {
            String originalFileName = file.getOriginalFilename();
            String extension = "";
            if (originalFileName != null && originalFileName.lastIndexOf(".") > -1) {
                extension = originalFileName.substring(originalFileName.lastIndexOf("."));
            }

            String savedFileName = UUID.randomUUID().toString() + extension;
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
        int result = inquiryMapper.insertInquiry(inquiryVO);
        return result > 0 ? "SUCCESS" : "FAIL";
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

}