package com.mtf.artixel.mapper;

import com.mtf.artixel.dto.CommentDTO;
import com.mtf.artixel.vo.Criteria;
import org.apache.ibatis.annotations.Mapper;
import java.util.List;

@Mapper
public interface CommentMngMapper {

    // 댓글 목록 조회 (검색 + 페이징)
    List<CommentDTO> selectCommentList(Criteria cri);

    // 전체 댓글 수 (페이징용)
    int getTotalCount(Criteria cri);

    // 댓글 삭제 (상태 변경: 'Y' -> 'N' 또는 status 컬럼 이용)
    // 기존 CommentDTO/Table 구조에 따라 del_yn='Y' 로 업데이트한다고 가정
    void deleteComment(Long commentId);
}