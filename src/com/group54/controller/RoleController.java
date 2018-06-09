package com.group54.controller;

import com.group54.enity.Role;
import com.group54.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.json.MappingJackson2JsonView;

@Controller("roleController")
@RequestMapping("/role")
public class RoleController {
    @Autowired
    private RoleService roleService=null;

    @RequestMapping(value = "/getRole1", method = RequestMethod.GET)
    public org.springframework.web.servlet.ModelAndView getRole2(@RequestParam("id") int id) {
        Role role = roleService.getRole(id);
        int id1=1;
        Role role1=roleService.getRole(id1);
        System.out.println(role1.getRoleName());
        System.out.println(role.getRoleName());
        org.springframework.web.servlet.ModelAndView mv = new org.springframework.web.servlet.ModelAndView();
        mv.addObject("role", role);

        // 指定视图类型
        mv.setView(new MappingJackson2JsonView());
        return mv;
    }

    @RequestMapping(value = "/getRole2", method = RequestMethod.GET)
    public org.springframework.web.servlet.ModelAndView getRole(@RequestParam("id") int id) {
        Role role = roleService.getRole(id);
        org.springframework.web.servlet.ModelAndView mv = new org.springframework.web.servlet.ModelAndView();
        mv.setViewName("roleDetails");
        // 给数据模型添加一个角色对象
        mv.addObject("role", role);
        return mv;
    }

    //从url获取参数
    //ModelAndView 是 servelet的那个
    @RequestMapping(value = "/get/{id}", method = RequestMethod.GET)
    public ModelAndView path(@PathVariable("id") int id){
        //该注解表示从url获取参数
        Role role=roleService.getRole(id);
        ModelAndView mv=new ModelAndView();
        mv.addObject(role);
        System.out.println(role.getRoleName());
        mv.setView(new MappingJackson2JsonView());
        return mv;
    }

}
