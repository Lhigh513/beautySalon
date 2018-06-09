package com.group54.controller;

import com.group54.enity.Customer;
import com.group54.service.CustomerService;
import com.group54.service.MonthChartService;
import com.group54.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.json.MappingJackson2JsonView;

import java.util.List;

@Controller
@RequestMapping("/admin")
public class CustomerController {
    @Autowired
    private CustomerService customerService=null;
    @Autowired
    private OrderService orderService=null;
    @Autowired
    private MonthChartService monthChartService=null;
    @RequestMapping("/customer")
    @ResponseBody
    public ModelAndView showCustomer(){
        ModelAndView model=new ModelAndView();
        model.addObject("customer", customerService.getAllCustomer());
        model.setView(new MappingJackson2JsonView());
        model.setViewName("customer");
        return model;
    }

    @RequestMapping(value = "/addCustomer",method = RequestMethod.POST)
    @ResponseBody
    public ModelAndView addCustomer(@RequestBody String[] params){
        ModelAndView modelAndView=new ModelAndView();
        if(customerService.addCustomer(params)) {
            modelAndView.setView(new MappingJackson2JsonView());
        }
        return modelAndView;
    }

    @RequestMapping(value = "/editCustomer",method = RequestMethod.POST)
    @ResponseBody
    public ModelAndView updatecustomer(@RequestBody String[] params){
        ModelAndView modelAndView=new ModelAndView();
        if(customerService.updateCustomer(params)) {
            modelAndView.setView(new MappingJackson2JsonView());
        }
        return modelAndView;
    }

    @RequestMapping(value = "/deleteCustomer",method = RequestMethod.POST)
    @ResponseBody
    public ModelAndView deleteCustomer(@RequestBody String param){
        ModelAndView modelAndView=new ModelAndView();
        if(customerService.deleteCustomer(param.replace("\"",""))){
            modelAndView.setView(new MappingJackson2JsonView());
        }
        return modelAndView;
    }



}
