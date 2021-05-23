package org.zerock.domain;

import lombok.Data;

import java.util.Date;

@Data
public class BoardVO {
    private Long boardNo;
    private int boardKinds;
    private String boardTitle;
    private Date boardRegdate;
    private Date boardUpdatedate;
    private int boardHit;
    private String boardContent;
    private String memId;
    private String memNickname;
    private int boardReplycnt;
}
