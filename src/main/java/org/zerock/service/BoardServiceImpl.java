package org.zerock.service;

import lombok.Setter;
import lombok.extern.log4j.Log4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.zerock.domain.BoardVO;
import org.zerock.mapper.BoardMapper;
import org.zerock.mapper.ReplyMapper;
import org.zerock.mapper.UploadFileMapper;

import java.util.List;

@Log4j
@Service
public class BoardServiceImpl implements BoardService {

    @Setter(onMethod_ = @Autowired)
    private BoardMapper mapper;

    @Setter(onMethod_ = @Autowired)
    private ReplyMapper replyMapper;

    @Setter(onMethod_ = @Autowired)
    private UploadFileMapper uploadMapper;

    @Override
    public void register(BoardVO board) {
        mapper.insertSelectkey(board);
    }

    @Transactional
    @Override
    public BoardVO get(Long boardNo) {
        log.info("get....." + boardNo);
        return mapper.read(boardNo);
    }

    @Override
    public boolean modify(BoardVO board) {
        log.info("modify...." + board);
        return mapper.update(board) == 1;
    }

    @Transactional
    @Override
    public boolean remove(Long boardNo) {
        log.info("remove...." + boardNo);

        uploadMapper.deleteFileAll(boardNo);
        replyMapper.deleteReplyAll(boardNo);
        return mapper.delete(boardNo) == 1;
    }

    @Override
    public List<BoardVO> getFreeList() {
        log.info("getList.......");
        return mapper.getFreeList();
    }

    @Override
    public List<BoardVO> getTripList() {
        log.info("getList.......");
        return mapper.getTripList();
    }

    @Override
    public List<BoardVO> getMyList(String memNickname) {
        return mapper.getMyList(memNickname);
    }

    @Override
    public int deleteMember(String memId) {
        return mapper.deleteMember(memId);
    }

    @Override
    public int updateBoardhit(Long boardNo) {
        return mapper.updateBoardhit(boardNo);
    }

}
