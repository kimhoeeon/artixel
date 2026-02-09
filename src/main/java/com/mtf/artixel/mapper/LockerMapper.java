package com.mtf.artixel.mapper;

import com.mtf.artixel.vo.LockerVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface LockerMapper {
    List<LockerVO> selectPostList(LockerVO params);

    LockerVO selectPostById(Long postId);

    int insertPost(LockerVO lockerVO);

    int updateViewCount(Long postId);
}