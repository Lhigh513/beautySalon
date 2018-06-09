package com.group54.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller("indexController")
@RequestMapping("/admin")
public class IndexController {
    @RequestMapping("/index")

    public ModelAndView index() {
        //模型和视图
        ModelAndView mv = new ModelAndView();
        //视图逻辑名称为index
        mv.setViewName("index");
        //返回模型和视图
        return mv;
    }
}
