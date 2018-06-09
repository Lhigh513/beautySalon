package com.group54.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/admin")
public class LogoutController {

    @RequestMapping("/logout")
    public String logout(HttpSession session){
        session.removeAttribute("role");
        return "redirect:./login.jsp";
    }
}
