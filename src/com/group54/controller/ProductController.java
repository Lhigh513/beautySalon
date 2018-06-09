package com.group54.controller;

import com.group54.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.json.MappingJackson2JsonView;

@Controller
@RequestMapping("/admin")
public class ProductController {
    @Autowired
    private ProductService productService=null;

    @RequestMapping("/product")
    public ModelAndView showProduct(){
        ModelAndView modelAndView=new ModelAndView();
        modelAndView.addObject("product",productService.showProduct());
        modelAndView.addObject("categoryName",productService.getAllCategoryName());
        modelAndView.setViewName("product");
        return modelAndView;
    }

    @RequestMapping("/edit/product")
    @ResponseBody
    public ModelAndView updateProduct(@RequestBody String[] parms){
        ModelAndView modelAndView=new ModelAndView();
        if(productService.updateProduct(parms)){
            modelAndView.setView(new MappingJackson2JsonView());
        }
        return modelAndView;
    }

    @RequestMapping("/add/product")
    @ResponseBody
    public ModelAndView addProduct(@RequestBody String[] parms){
        ModelAndView modelAndView=new ModelAndView();
        if(productService.addProduct(parms)){
            modelAndView.setView(new MappingJackson2JsonView());
        }
        return modelAndView;
    }

    @RequestMapping("/delete/product")
    @ResponseBody
    public ModelAndView deleteProduct(@RequestBody String param){
        ModelAndView modelAndView=new ModelAndView();
        if(productService.deleteProduct(param)){
            modelAndView.setView(new MappingJackson2JsonView());
        }
        return modelAndView;
    }

}
