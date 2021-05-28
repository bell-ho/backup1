package org.zerock.service;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.zerock.domain.MemberVO;
import org.zerock.domain.StatVO;
import org.zerock.mapper.StatMapper;

import java.util.List;

@Service
@RequiredArgsConstructor
public class StatServiceImpl implements StatService {

    private final StatMapper statMapper;

    @Override
    public List<StatVO> stat(MemberVO memberVO) {

        return statMapper.myStat(memberVO);
    }
}
