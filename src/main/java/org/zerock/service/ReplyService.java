package org.zerock.service;

import org.zerock.domain.ReplyVO;

import java.util.List;

public interface ReplyService {

    int insert(ReplyVO vo); //댓글 작성

    ReplyVO get(int ReplyNO); //댓글 1개 가지고오기

    int delete(int ReplyNO); //댓글 삭제

    int update(ReplyVO vo); // 댓글 수정

    List<ReplyVO> getList(Long boardNo); //게시글의 댓글 가지고 오기

    int deleteReplyAll(Long boardNo);

    int deleteMember(String memId);
}
