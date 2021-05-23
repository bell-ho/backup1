package org.zerock.domain;

import lombok.Data;

@Data
public class UploadFileVO {
    private int fileNo;
    private Long boardNo;
    private String fileName;
    private String memId;
}
