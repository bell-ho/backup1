package org.zerock.service;

import lombok.Setter;
import lombok.extern.log4j.Log4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.zerock.domain.Criteria;
import org.zerock.domain.UploadFileVO;
import org.zerock.mapper.UploadFileMapper;

import java.util.List;

@Log4j
@Service
public class UploadFileServiceImpl implements UploadFileService {

    @Setter(onMethod_ = @Autowired)
    private UploadFileMapper mapper;

    @Override
    public List<UploadFileVO> getTripList(Criteria cri) {
        log.info("GetUploadFile ");
        return mapper.getTripList(cri);
    }

    @Override
    public int insert(UploadFileVO uploadVo) {
        log.info("UploadFile ");
        return mapper.insert(uploadVo);
    }

    @Override
    public List<UploadFileVO> getListWithPaging(Criteria cri) {
        log.info("uploadFileList ");
        return mapper.getListWithPaging(cri);
    }

    @Override
    public int totalAll(Criteria cri) {
        return mapper.totalAll(cri);
    }

    @Override
    public int totalTrip(Criteria cri) {
        return mapper.totalTrip(cri);
    }

    @Override
    public int deleteFileAll(long boardNo) {
        return mapper.deleteFileAll(boardNo);
    }

    @Override
    public List<UploadFileVO> get() {
        return mapper.get();
    }

    @Override
    public int deleteMember(String memId) {
        return mapper.deleteMember(memId);
    }
}
