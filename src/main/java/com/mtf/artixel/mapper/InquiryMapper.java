package com.mtf.artixel.mapper;

import org.apache.ibatis.annotations.Mapper;
import com.mtf.artixel.vo.InquiryVO;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

@Mapper
public interface InquiryMapper {

    // 1. 사용자: 문의 등록 (Contact 폼)
    int insertInquiry(InquiryVO inquiryVO);

    // 2. 사용자: 스팸 방지용 IP 체크 (1분 이내 등록 건수 조회)
    int selectRecentInquiryCountByIp(String clientIp);

    // 3. 관리자: 목록 조회 (검색 조건 포함)
    List<InquiryVO> selectInquiryList(InquiryVO inquiryVO);

    // 4. 관리자: 페이징 처리를 위한 전체 데이터 개수 조회
    int selectInquiryListCount(InquiryVO inquiryVO);

    // 5. 관리자: 상세 보기
    InquiryVO selectInquiryDetail(Long inquiryId);

    // 6. 관리자: 문의 삭제
    int deleteInquiry(Long inquiryId);

    // 7. 관리자: 진행 상태 변경
    int updateInquiryStatus(InquiryVO inquiryVO);

    // [신규] 8. 대시보드: 누적 문의 건수
    int selectTotalInquiryCount();

    // [신규] 9. 대시보드: 금일 신규 문의 건수
    int selectTodayInquiryCount();

    // [신규] 대시보드: 누적 전체 방문자 및 순 방문자 (access_logs 테이블 연동)
    int selectTotalVisitors();
    int selectTotalUniqueVisitors();

    // [대시보드 차트] 동적 기간(DAY, WEEK, MONTH) 적용
    List<Map<String, Object>> selectVisitorTrend(@Param("period") String period);
    List<Map<String, Object>> selectInquiryTrendByCategory(@Param("period") String period);
    List<Map<String, Object>> selectCountryStat(@Param("period") String period);

}