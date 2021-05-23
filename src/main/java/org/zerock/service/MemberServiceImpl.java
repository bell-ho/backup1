package org.zerock.service;

import lombok.Setter;
import lombok.extern.log4j.Log4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.zerock.domain.MemberVO;
import org.zerock.mapper.MemberMapper;

import java.util.List;

@Log4j
@Service
public class MemberServiceImpl implements MemberService {

    @Setter(onMethod_ = @Autowired)
    private MemberMapper mapper;

    @Setter(onMethod_ = @Autowired)
    private BCryptPasswordEncoder encoder;

    @Setter(onMethod_ = @Autowired)
    private ReplyService replyService;

    @Setter(onMethod_ = @Autowired)
    private UploadFileService uploadService;

    @Setter(onMethod_ = @Autowired)
    private BoardService boardService;

    @Override
    public int insert(MemberVO vo) {
        vo.setMemPassword(encoder.encode(vo.getMemPassword()));
        vo.setRole("ROLE_MEMBER");
        return mapper.insert(vo);
    }

    @Override
    public MemberVO get(String memId) {
        return mapper.get(memId);
    }

    @Override
    public List<MemberVO> getAll() {
        return mapper.getAll();
    }

    @Transactional
    @Override
    public int delete(MemberVO vo) {
        if (encoder.matches(vo.getMemPassword(), mapper.get(vo.getMemId()).getMemPassword())) {
            replyService.deleteMember(vo.getMemId());
            uploadService.deleteMember(vo.getMemId());
            boardService.deleteMember(vo.getMemId());
            return mapper.delete(vo);
        } else {
            return 0;
        }

    }

    @Override
    public int update(MemberVO vo) {
        if (encoder.matches(vo.getMemPassword(), mapper.get(vo.getMemId()).getMemPassword())) {
            vo.setNewMemPassword(encoder.encode(vo.getNewMemPassword()));
            return mapper.update(vo);
        }
        return 0;
    }

    @Override
    public int memUpdate(MemberVO vo) {
        if (encoder.matches(vo.getMemPassword(), mapper.get(vo.getMemId()).getMemPassword())) {
            vo.setMemPassword(encoder.encode(vo.getMemPassword()));
            return mapper.memupdate(vo);
        }
        return 0;
    }

    @Override
    public int memImgUpdate(MemberVO vo) {
        return mapper.memimgupdate(vo);
    }
}
