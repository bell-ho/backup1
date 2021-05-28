package org.zerock.domain;

import lombok.Data;

@Data
public class StatVO {
    private String memId;
    private int totNumBoard;
    private int totNumReply;
    private int totBoardHit;
    private int maxBoardHit;
    private int maxBoardHitNum;
}
