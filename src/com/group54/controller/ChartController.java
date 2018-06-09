package com.group54.controller;

import com.group54.service.MonthChartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.json.MappingJackson2JsonView;

@Controller
@RequestMapping("/admin")
public class ChartController {
    @Autowired
    private MonthChartService monthChartService=null;

    @RequestMapping("/chart")
    @ResponseBody
    public ModelAndView monthChart(){

        ModelAndView model=new ModelAndView();
        model.addObject("monthChart", monthChartService.getMonthChart());
        model.setView(new MappingJackson2JsonView());

        return model;
    }


    @RequestMapping("/productChart")
    @ResponseBody
    public ModelAndView productChart(){
        ModelAndView model=new ModelAndView();
        model.addObject("productChart", monthChartService.getProductChart());
        model.setView(new MappingJackson2JsonView());
        return model;
    }
}
