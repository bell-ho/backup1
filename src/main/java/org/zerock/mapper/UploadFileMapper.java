package org.zerock.mapper;

import org.zerock.domain.Criteria;
import org.zerock.domain.UploadFileVO;

import java.util.List;

public interface UploadFileMapper {
    public List<UploadFileVO> getTripList(Criteria cri);    // 후기게시글 목록

    public int insert(UploadFileVO uploadVo);    //게시글 등록

    public List<UploadFileVO> getListWithPaging(Criteria cri);

    public int totalAll(Criteria cri);

    public int totalTrip(Criteria cri);

    public int deleteFileAll(Long boardNo);

    public List<UploadFileVO> get();

    public int deleteMember(String memId);
}
