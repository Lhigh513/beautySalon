package com.group54.controller;

import com.group54.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.json.MappingJackson2JsonView;

@Controller
@RequestMapping("/admin")
public class CategoryController {
    @Autowired
    private CategoryService categoryService=null;

    @RequestMapping("/category")
    @ResponseBody
    public ModelAndView showCategory(){
        ModelAndView modelAndView=new ModelAndView();
        modelAndView.addObject("category",categoryService.getAllCategory());
        modelAndView.setView(new MappingJackson2JsonView());
        modelAndView.setViewName("category");
        return modelAndView;
    }

    @RequestMapping(value = "/addCategory",method = RequestMethod.POST)
    @ResponseBody
    public ModelAndView addCategory(@RequestBody String[] params){
        ModelAndView modelAndView=new ModelAndView();
        if(categoryService.insertCategory(params)) {
            modelAndView.setView(new MappingJackson2JsonView());
        }
        return modelAndView;
    }

    @RequestMapping(value = "/editCategory",method = RequestMethod.POST)
    @ResponseBody
    public ModelAndView updateCategory(@RequestBody String[] params){
        ModelAndView modelAndView=new ModelAndView();
        if(categoryService.updateCategory(params)) {
            modelAndView.setView(new MappingJackson2JsonView());
        }
        return modelAndView;
    }

    @RequestMapping(value = "/deleteCategory",method = RequestMethod.POST)
    @ResponseBody
    public ModelAndView deleteCustomer(@RequestBody String param){
        ModelAndView modelAndView=new ModelAndView();
        if(categoryService.deleteCategory(param.replace("\"",""))){
            modelAndView.setView(new MappingJackson2JsonView());
        }
        return modelAndView;
    }
}
