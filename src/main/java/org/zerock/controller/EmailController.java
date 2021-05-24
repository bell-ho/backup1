package org.zerock.controller;

import lombok.Setter;
import lombok.extern.log4j.Log4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@Log4j
public class EmailController {
    @Autowired
    private MailSender mailSender;

    public void setJavaMailSender(MailSender mailSender) {
        this.mailSender = mailSender;
    }

    @PostMapping(value = "/ajax/email", produces = "text/plain;charset=UTF-8")
    @ResponseBody
    public String email(String memEmail, Model model) {
        int num = (int) Math.ceil((Math.random() * 10000));
        model.addAttribute("result", num);
        SimpleMailMessage mailMessage = new SimpleMailMessage();
        mailMessage.setSubject("회원가입을 환영합니다");
        mailMessage.setFrom("seodonguk1128@gmail.com");
        mailMessage.setText("인증번호는" + num);
        mailMessage.setTo(memEmail);
        try {
            mailSender.send(mailMessage);
        } catch (Exception e) {
            // TODO: handle exception'
            log.info(e.getMessage());
        }
        System.out.println(num);
        return num + "";
    }
}