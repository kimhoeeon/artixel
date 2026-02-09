package com.mtf.artixel.service;

import com.mtf.artixel.dto.CommentDTO;
import com.mtf.artixel.mapper.CommentMngMapper;
import com.mtf.artixel.vo.Criteria;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@RequiredArgsConstructor
public class CommentMngService {

    private final CommentMngMapper commentMngMapper;

    public List<CommentDTO> getCommentList(Criteria cri) {
        return commentMngMapper.selectCommentList(cri);
    }

    public int getTotal(Criteria cri) {
        return commentMngMapper.getTotalCount(cri);
    }

    @Transactional
    public void deleteComment(Long commentId) {
        commentMngMapper.deleteComment(commentId);
    }
}