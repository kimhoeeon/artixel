package com.mtf.artixel.mapper;

import org.apache.ibatis.annotations.Mapper;
import com.mtf.artixel.vo.InquiryVO;
import java.util.List;

@Mapper
public interface InquiryMapper {

    // 1. 문의 등록 (Contact 폼)
    int insertInquiry(InquiryVO inquiryVO);

    // 2. 스팸 방지용 IP 체크 (1분 이내 등록 건수 조회)
    int selectRecentInquiryCountByIp(String clientIp);

    // 3. 관리자 목록 조회 (검색 조건 포함)
    List<InquiryVO> selectInquiryList(InquiryVO inquiryVO);

    // 4. 페이징 처리를 위한 전체 데이터 개수 조회
    int selectInquiryListCount(InquiryVO inquiryVO);

    // 5. 관리자 상세 보기
    InquiryVO selectInquiryDetail(Long inquiryId);

    // 6. 관리자 문의 삭제
    int deleteInquiry(Long inquiryId);

    // 7. 진행 상태 변경 (대기 -> 분석중 등)
    int updateInquiryStatus(InquiryVO inquiryVO);
}