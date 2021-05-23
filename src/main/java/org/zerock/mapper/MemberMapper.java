package org.zerock.mapper;

import org.zerock.domain.MemberVO;

import java.util.List;

public interface MemberMapper {
    public MemberVO get(String memId);

    public int insert(MemberVO vo);

    public List<MemberVO> getAll();

    public int delete(MemberVO vo);

    public int update(MemberVO vo);

    public int memupdate(MemberVO vo);

    public int memimgupdate(MemberVO vo);
}
