package org.zerock.controller;

import lombok.Setter;
import lombok.extern.log4j.Log4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.zerock.domain.ReplyVO;
import org.zerock.service.ReplyService;

import java.security.Principal;
import java.util.List;

@Log4j
@RequestMapping("/reply/*")
@Controller
public class ReplyController {

    @Setter(onMethod_ = @Autowired)
    private ReplyService service;

    //	/reply/insert를post방식으로 요청
    @PostMapping(value = "/insert")
    public String insert(ReplyVO vo, Principal principal) {
        vo.setMemId(principal.getName());
        int result = service.insert(vo);
        log.info("결과  = " + result);
        return "redirect:/board/get?boardNo=" + vo.getBoardNo();
    }

    //	/reply/page/boardNo/page 를요청하면 json 타입으로 응답 매개변수는 @pathVariable로 받아온다
    @GetMapping(value = "/{boardNo}", produces = {MediaType.APPLICATION_JSON_UTF8_VALUE})
    @ResponseBody
    public List<ReplyVO> getList(@PathVariable("boardNo") Long boardNo) {
        List<ReplyVO> list = service.getList(boardNo);
        log.info(list);
        return list;
    }

    @GetMapping(value = "/{boardNo}/{ReplyNO}", produces = {MediaType.APPLICATION_JSON_UTF8_VALUE})
    @ResponseBody
    public ReplyVO get(@PathVariable("ReplyNO") int ReplyNO) {
        ReplyVO vo = service.get(ReplyNO);
        return vo;
    }

    @PostMapping(value = "/{boardNo}/{ReplyNO}")
    public String delete(@PathVariable("boardNo") Long boardNo, @PathVariable("ReplyNO") int ReplyNO) {
        log.info("delete" + ReplyNO);
        int result = service.delete(ReplyNO);
        return "redirect:/board/get?boardNo=" + boardNo;
    }

    @PostMapping(value = "/{boardNo}/update")
    public String update(@PathVariable("boardNo") Long boardNo, ReplyVO vo) {
        log.info("update" + vo);
        int result = service.update(vo);
        return "redirect:/board/get?boardNo=" + boardNo;
    }
}
