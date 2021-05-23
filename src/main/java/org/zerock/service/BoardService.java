package org.zerock.service;

import org.zerock.domain.BoardVO;

import java.util.List;

public interface BoardService {
    void register(BoardVO board);

    BoardVO get(Long boardNo);

    boolean modify(BoardVO board);

    boolean remove(Long boardNo);

    List<BoardVO> getFreeList();

    List<BoardVO> getTripList();

    List<BoardVO> getMyList(String memNickname);

    int deleteMember(String memId);

    int updateBoardhit(Long boardNo);
}
