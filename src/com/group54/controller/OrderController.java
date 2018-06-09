package com.group54.controller;

import com.group54.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.json.MappingJackson2JsonView;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/admin")
public class OrderController {

    @Autowired
    private OrderService orderService=null;

    private ModelAndView modelAndView1=new ModelAndView();

    @RequestMapping("/newOrder")
    @ResponseBody
    public ModelAndView newOrder(){
        ModelAndView modelAndView=new ModelAndView();
        modelAndView.addObject("orderId",orderService.getOrderIdByGrade("\"0\""));
        modelAndView.addObject("employeeName",orderService.getEmployeeName());
        modelAndView.addObject("productName",orderService.getProductName());
        modelAndView.setViewName("order");
        return modelAndView;
    }

    @RequestMapping(value = "/getOrder")
    public ModelAndView  getMoney( String orderId,String date,String employee,String[] productList){
       int orderMoney=orderService.getTotalMoney(productList);
        List<String> products=new ArrayList<>();
        for (int i=0;i<productList.length;i++){
            products.add(productList[i]);
        }
        ModelAndView modelAndView=new ModelAndView();
        modelAndView.addObject("orderId",orderId);
        modelAndView.addObject("date",date);
        modelAndView.addObject("employee",employee);
        modelAndView.addObject("products",products);
        modelAndView.addObject("orderMoney",orderMoney);
        modelAndView.setViewName("confirmorder");
        return modelAndView;
    }

    @RequestMapping(value = "/getVipOrder")
    public ModelAndView  getOrderMoney( String orderId,String vipId,String vipName,String vipPhone,String date,String employee,String[] productList){
        int orderMoney=orderService.getTotalMoney(productList);
        List<String> products=new ArrayList<>();
        for (int i=0;i<productList.length;i++){
            products.add(productList[i]);
        }
        ModelAndView modelAndView=new ModelAndView();
        modelAndView.addObject("orderId",orderId);
        modelAndView.addObject("vipId",vipId);
        modelAndView.addObject("vipName",vipName);
        modelAndView.addObject("vipPhone",vipPhone);
        modelAndView.addObject("date",date);
        modelAndView.addObject("employee",employee);
        modelAndView.addObject("products",products);
        modelAndView.addObject("orderMoney",orderMoney);
        modelAndView.setViewName("vipconfirmorder");
        return modelAndView;
    }

    @RequestMapping(value = "/showPreOrder")
    public ModelAndView showOrderList(){
        ModelAndView modelAndView=new ModelAndView();
        modelAndView.addObject("preOrder",orderService.getPreOrderList());
        modelAndView.addObject("tempMoney",orderService.showTempMoneyList());
        modelAndView.addObject("vipOrder",orderService.showVipOrder());
        modelAndView.setViewName("preorder");
        return modelAndView;
    }

    @RequestMapping(value = "/showDoneOrder")
    public ModelAndView showDoneList(){
        ModelAndView modelAndView=new ModelAndView();
        modelAndView.addObject("doneOrder",orderService.getDoneOrderList());
        modelAndView.setViewName("doneorder");
        return modelAndView;
    }

    @RequestMapping(value = "/createPreOrder")
    @ResponseBody
    public ModelAndView createPreOrder(@RequestBody String[] params){
        ModelAndView modelAndView=new ModelAndView();
        if( orderService.createPreorder(params)){
            modelAndView.setView(new MappingJackson2JsonView());
        }
        return modelAndView;
    }

    @RequestMapping(value = "/createDoneOrder")
    @ResponseBody
    public ModelAndView createDoneOrder(@RequestBody String[] params){
        ModelAndView modelAndView=new ModelAndView();
        if(orderService.createDoneOrder(params)){
            modelAndView.setView(new MappingJackson2JsonView());
        }
        return modelAndView;
    }
    @RequestMapping(value = "/createVipOrder")
    @ResponseBody
    public ModelAndView createVipOrder(@RequestBody String[] params){
        ModelAndView modelAndView=new ModelAndView();
        if(orderService.insertVipOrder(params)){
            modelAndView.setView(new MappingJackson2JsonView());
        }

        return modelAndView;
    }


    @RequestMapping(value ="/changeStatus")
    @ResponseBody
    public ModelAndView changeStatus(@RequestBody String param){
        ModelAndView modelAndView=new ModelAndView();
        if( orderService.changeStatus(param)){
            modelAndView.setView(new MappingJackson2JsonView());
        }
        return modelAndView;
    }

    @RequestMapping(value = "/deletePreOrder")
    @ResponseBody
    public ModelAndView deletePreOrder(@RequestBody String param){
        ModelAndView modelAndView=new ModelAndView();
        if(orderService.deletePreOrder(param)){
            modelAndView.setView(new MappingJackson2JsonView());
        }return modelAndView;
    }

    @RequestMapping(value = "/deleteDoneOrder")
    @ResponseBody
    public ModelAndView deleteDoneOrder(@RequestBody String param){
        ModelAndView modelAndView=new ModelAndView();
        if(orderService.deleteDoneOrder(param)){
            modelAndView.setView(new MappingJackson2JsonView());
        }return modelAndView;
    }

    @RequestMapping(value = "/VipOrder" )
    @ResponseBody
    public ModelAndView vipOrder(@RequestBody String[] param){
        System.out.println("work"+param);
        modelAndView1.addObject("vipId",param[0].replace("\"",""));
        modelAndView1.addObject("vipName",param[1].replace("\"",""));
        modelAndView1.addObject("vipPhone",param[3].replace("\"",""));
        modelAndView1.addObject("orderId",orderService.getOrderIdByGrade(param[2]));
        modelAndView1.addObject("employeeName",orderService.getEmployeeName());
        modelAndView1.addObject("productName",orderService.getProductName());
        modelAndView1.setViewName("viporder");
        return modelAndView1;
    }

    @RequestMapping(value = "/showvipOrder")
    @ResponseBody
    public ModelAndView showvipOrder(){

        modelAndView1.setViewName("viporder");
        return modelAndView1;
    }
}
