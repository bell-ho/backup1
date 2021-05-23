package org.zerock.domain;

import lombok.Data;

import java.util.Date;

@Data
public class MemberVO {
    private String memId;
    private String memPassword;
    private String memEmail;
    private String memReceiveEmail;
    private String memNickname;
    private String memImg;
    private Date memRegisterDate;
    private String role;
    private String newMemPassword;

}
