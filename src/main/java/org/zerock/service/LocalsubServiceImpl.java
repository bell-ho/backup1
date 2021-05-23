package org.zerock.service;


import lombok.Setter;
import lombok.extern.log4j.Log4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.zerock.domain.LocalsubVO;
import org.zerock.mapper.LocalsubMapper;

import java.util.List;

@Log4j
@Service
public class LocalsubServiceImpl implements LocalsubService {

    @Setter(onMethod_=@Autowired)
    private LocalsubMapper mapper;

    @Override
    public List<LocalsubVO> list() {
        // TODO Auto-generated method stub
        log.info("Test");
        return mapper.list();
    }

    @Override
    public LocalsubVO getTest(String name) {
        log.info("get");
        return mapper.getTest(name);
    }
}
