package org.zerock.mapper;

import org.apache.ibatis.annotations.Param;
import org.zerock.domain.ReplyVO;

import java.util.List;

public interface ReplyMapper {
    int insert(ReplyVO vo); //댓글 작성

    List<ReplyVO> getList(@Param("boardNo") Long boardNo);

    int delete(int ReplyNO); //댓글 삭제

    int update(ReplyVO vo); //댓글 수정

    ReplyVO get(int ReplyNO); //댓글 한개가지고 오기

    int deleteReplyAll(Long boardNo); //게시물에 있는 댓글 다지우기

    int deleteMember(String memId);
}
