package com.mtf.artixel.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class InquiryVO {
    private Long inquiryId;          // 의뢰 번호
    private String category;         // 구분
    private String clientName;       // 성함
    private String countryCode;      // 국가번호
    private String contact;          // 연락처
    private String email;            // 이메일
    private String country;          // 국가 선택
    private String artworkTitle;     // 작품 제목
    private String artworkSize;      // 작품 크기
    private String artistName;       // 작가명
    private String content;          // 문의 내용
    private String fileUrl;          // 첨부파일 URL
    private String filePath;         // 업로드된 파일 물리적 경로
    private String fileOriginName;   // 업로드된 원본 파일명
    private String agreePrivacy;     // 개인정보 수집 이용 동의 여부
    private String status;           // 진행 상태
    private String clientIp;         // 스팸 방지용 작성자 디바이스 IP
    private String createdAt;        // 접수 일시
    private String updatedAt;        // 수정 일시

    // 관리자 페이지 검색 및 페이징용 추가 필드
    private String searchType;       // 검색 조건 (예: name, contact)
    private String keyword;          // 검색어
    private String startDate;        // 검색 시작일 (YYYY-MM-DD)
    private String endDate;          // 검색 종료일 (YYYY-MM-DD)
    private int limitStart;          // 페이징 LIMIT 시작 위치
    private int recordSize;          // 한 페이지당 노출할 데이터 개수
}