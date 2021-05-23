package org.zerock.service;

import org.zerock.domain.MemberVO;

import java.util.List;

public interface MemberService {

    int insert(MemberVO vo);

    MemberVO get(String memId);

    List<MemberVO> getAll();

    int delete(MemberVO vo);

    int update(MemberVO vo);

    int memUpdate(MemberVO vo);

    int memImgUpdate(MemberVO vo);
}
