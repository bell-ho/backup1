package org.zerock.domain;

import lombok.Data;

import java.util.Date;

@Data
public class ReplyVO{
    private int ReplyNO;
    private Long boardNo;
    private String replyContent;
    private Date replyDate;
    private Date replyUpdatedate;
    private String memId;
    private String memNickname;
    private String memImg;
}