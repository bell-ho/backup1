package org.zerock.mapper;

import org.apache.ibatis.annotations.Param;
import org.zerock.domain.BoardVO;

import java.util.List;

public interface BoardMapper {
    List<BoardVO> getFreeList();    // 자유게시글 목록

    List<BoardVO> getTripList();    // 후기게시글 목록

    List<BoardVO> getMyList(String memNickname); // 자기가 쓴글 게시판

    void insert(BoardVO board);    //게시글 등록

    void insertSelectkey(BoardVO board); //게시글 등록

    BoardVO read(Long boardNo); //자유게시글 상세

    int delete(Long boardNo); //게시글 삭제

    int update(BoardVO board); //게시글 수정

    void updateReplyCnt(@Param("boardNo") Long boardNo, @Param("amount") int amount);

    int deleteMember(String memId);

    int updateBoardhit(Long boardNo);
}
