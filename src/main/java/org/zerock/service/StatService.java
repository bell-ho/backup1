package org.zerock.service;

import org.zerock.domain.MemberVO;
import org.zerock.domain.StatVO;

import java.util.List;

public interface StatService {
    List<StatVO> stat(MemberVO memberVO);
}
