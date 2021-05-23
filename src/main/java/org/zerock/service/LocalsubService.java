package org.zerock.service;

import org.zerock.domain.LocalsubVO;

import java.util.List;

public interface LocalsubService {
    List<LocalsubVO> list();

    LocalsubVO getTest(String name);
}
