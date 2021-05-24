package org.zerock.controller;

import lombok.Setter;
import lombok.extern.log4j.Log4j;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.zerock.domain.LocalsubVO;
import org.zerock.service.LocalsubService;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

@Log4j
@Controller
public class HomeController {
    @Autowired
    private LocalsubService service;

    private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

    private static final String String = null;

    /**
     * Simply selects the home view to render by returning its name.
     */
    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String home(Locale locale, Model model) {
        logger.info("Welcome home! The client locale is {}.", locale);
        Date date = new Date();
        DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
        List<LocalsubVO> list = service.list();
        String formattedDate = dateFormat.format(date);
        log.info(list);
        model.addAttribute("serverTime", formattedDate);
        model.addAttribute("list", list);
        return "main";
    }

    @RequestMapping("/MytripLogin")
    public void from() {

    }

    @RequestMapping("/naverLogivn")
    public void fromNaver() {

    }

    @RequestMapping("/information/{name}")
    public String information(@PathVariable("name") String name, Model model) {
        model.addAttribute("vo", service.getTest(name));
        return "information";
    }

    @RequestMapping("/trip/{key}")
    public String trip(@PathVariable("key") String key, Model model) {
        model.addAttribute("key", key.substring(0, 2));
        return "trip";
    }

    @RequestMapping("/detail/{key}/{contentid}")
    public String detail(@PathVariable("key") String key, @PathVariable("contentid") int contentid, Model model) {
        model.addAttribute("contentid", contentid);
        System.out.println(contentid);
        return "detail";
    }

    @RequestMapping("main")
    public void detail(String result, Model model) {
        List<LocalsubVO> list = service.list();
        model.addAttribute("list", list);
        model.addAttribute("result", result);

    }

    @RequestMapping("/test")
    public void test() {

    }
}
