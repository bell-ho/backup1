package org.zerock.mapper;

import org.zerock.domain.MemberVO;
import org.zerock.domain.StatVO;

import java.util.List;

public interface StatMapper {
    List<StatVO> myStat(MemberVO memberVO);
}
