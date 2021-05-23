package org.zerock.service;

import lombok.Setter;
import lombok.extern.log4j.Log4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.zerock.domain.ReplyVO;
import org.zerock.mapper.BoardMapper;
import org.zerock.mapper.ReplyMapper;

import java.util.List;

@Log4j
@Service
public class ReplyServiceImpl implements ReplyService {

    @Setter(onMethod_ = @Autowired)
    private ReplyMapper mapper;

    @Setter(onMethod_ = @Autowired)
    private BoardMapper boardMapper;

    @Transactional
    @Override
    public int insert(ReplyVO vo) {
        log.info("Reply Insert" + vo);
        boardMapper.updateReplyCnt(vo.getBoardNo(), 1);
        return mapper.insert(vo);
    }

    @Override
    public ReplyVO get(int ReplyNO) {
        log.info("Reply Get");
        return mapper.get(ReplyNO);
    }

    @Transactional
    @Override
    public int delete(int ReplyNO) {
        log.info("Reply Delete" + ReplyNO);
        ReplyVO vo = mapper.get(ReplyNO);
        boardMapper.updateReplyCnt(vo.getBoardNo(), -1);
        return mapper.delete(ReplyNO);
    }

    @Override
    public int update(ReplyVO vo) {
        log.info("Reply Update");
        return mapper.update(vo);
    }

    @Override
    public List<ReplyVO> getList(Long boardNo) {
        log.info("Reply getList");
        return mapper.getList(boardNo);
    }

    @Override
    public int deleteReplyAll(Long boardNo) {
        return mapper.deleteReplyAll(boardNo);
    }

    @Override
    public int deleteMember(String memId) {
        return mapper.deleteMember(memId);
    }
}
