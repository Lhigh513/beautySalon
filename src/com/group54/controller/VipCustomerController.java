package com.group54.controller;

import com.group54.service.VipCustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.json.MappingJackson2JsonView;

@Controller
@RequestMapping("/admin")
public class VipCustomerController {
    @Autowired
    private VipCustomerService vipCustomerService=null;

    @RequestMapping("/vip")
    @ResponseBody
    public ModelAndView showVip(){
        ModelAndView modelAndView=new ModelAndView();
        modelAndView.addObject("vip",vipCustomerService.getAllVip());
        modelAndView.setViewName("vip");
        return modelAndView;
    }

    @RequestMapping("/addVip")
    @ResponseBody
    public ModelAndView addVip(@RequestBody String[] params){
        ModelAndView modelAndView=new ModelAndView();
        for (int i=0;i<params.length;i++){
            System.out.println(params[i]);
        }
        if(vipCustomerService.addVip(params)){
            modelAndView.setView(new MappingJackson2JsonView());
        }return modelAndView;
    }

    @RequestMapping("/editVip")
    @ResponseBody
    public ModelAndView editVip(@RequestBody String[] params){
        for (int i=0;i<params.length;i++){
            System.out.println(params[i]);
        }
        ModelAndView modelAndView=new ModelAndView();
        if(vipCustomerService.updateVip(params)){
            modelAndView.setView(new MappingJackson2JsonView());
        }return modelAndView;
    }


    @RequestMapping("/deleteVip")
    @ResponseBody
    public ModelAndView deleteVip(@RequestBody String param){
        ModelAndView modelAndView=new ModelAndView();
        if(vipCustomerService.deleteVip(param.replace("\"",""))){
            modelAndView.setView(new MappingJackson2JsonView());
        }return modelAndView;
    }
}
