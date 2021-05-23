package org.zerock.service;

import org.zerock.domain.Criteria;
import org.zerock.domain.UploadFileVO;

import java.util.List;

public interface UploadFileService {

    List<UploadFileVO> getTripList(Criteria cri);

    int insert(UploadFileVO uploadVo);

    List<UploadFileVO> getListWithPaging(Criteria cri);

    int totalTrip(Criteria cri);

    int totalAll(Criteria cri);

    int deleteFileAll(long boardNo);

    List<UploadFileVO> get();

    int deleteMember(String memId);
}
