package com.group54.controller;

import com.group54.service.LoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/admin")
public class LoginController {
    @Autowired
    LoginService loginService=null;
@RequestMapping(value = "/login",method=RequestMethod.POST)
    public String login(HttpSession session, String id, String password)  {

        if(loginService.verify(id,password)){

           if(loginService.getRole(id)==1){
               session.setAttribute("role","admin");
           }else {
               session.setAttribute("role","user");
           }

            return "redirect:./index.do";
        }
        return "redirect:./error.do";
    }


    @RequestMapping("/error")
    public ModelAndView error(){
    ModelAndView modelAndView=new ModelAndView();
    modelAndView.setViewName("error");
    return modelAndView;
    }

}
