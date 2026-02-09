package com.mtf.artixel.mapper;

import com.mtf.artixel.vo.UserStatsVO;
import org.apache.ibatis.annotations.Mapper;
import java.util.List;

@Mapper
public interface StatsMngMapper {
    // 승률 랭킹 조회 (직관 수 많은 순 or 승률 높은 순)
    List<UserStatsVO> selectWinRateRanking();
}