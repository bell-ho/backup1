package org.zerock.mapper;

import org.zerock.domain.Criteria;
import org.zerock.domain.UploadFileVO;

import java.util.List;

public interface UploadFileMapper {
    List<UploadFileVO> getTripList(Criteria cri);    // 후기게시글 목록

    int insert(UploadFileVO uploadVo);    //게시글 등록

    List<UploadFileVO> getListWithPaging(Criteria cri);

    int totalAll(Criteria cri);

    int totalTrip(Criteria cri);

    int deleteFileAll(Long boardNo);

    List<UploadFileVO> get();

    int deleteMember(String memId);
}
