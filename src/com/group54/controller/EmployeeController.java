package com.group54.controller;

import com.group54.service.EmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.json.MappingJackson2JsonView;

@Controller
@RequestMapping("/admin")
public class EmployeeController {

    @Autowired
    EmployeeService employeeService=null;

    @RequestMapping("/employee")
    @ResponseBody
    public ModelAndView showEmployee(){
        ModelAndView modelAndView=new ModelAndView();
        modelAndView.addObject("employee",employeeService.showEmployee());
        modelAndView.addObject("roleName",employeeService.getRoleName());
        modelAndView.setViewName("employee");
        return modelAndView;
    }

    @RequestMapping("/addEmployee")
    @ResponseBody
    public ModelAndView addEmployee(@RequestBody String[] params){
        ModelAndView modelAndView=new ModelAndView();
        if(employeeService.insertEmployee(params)){
            modelAndView.setView(new MappingJackson2JsonView());
        }
        return modelAndView;
    }

    @RequestMapping("/editEmployee")
    @ResponseBody
    public ModelAndView editEmployee(@RequestBody String[] params){
        ModelAndView modelAndView=new ModelAndView();
        if(employeeService.updateEmployee(params)){
            modelAndView.setView(new MappingJackson2JsonView());
        }
        return modelAndView;
    }

    @RequestMapping("/deleteEmployee")
    @ResponseBody
    public ModelAndView deleteEmployee(@RequestBody String param){
        ModelAndView modelAndView=new ModelAndView();
        if(employeeService.deleteEmployee(param)){
            modelAndView.setView(new MappingJackson2JsonView());
        }
        return modelAndView;
    }
}
