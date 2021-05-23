package org.zerock.mapper;

import org.zerock.domain.LocalsubVO;

import java.util.List;

public interface LocalsubMapper {

    List<LocalsubVO> list();

    LocalsubVO getTest(String name);
}
