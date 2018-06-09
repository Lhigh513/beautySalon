package com.group54.service.impl;

import com.group54.dao.OrderDao;
import com.group54.enity.Order;
import com.group54.enity.OrderList;
import com.group54.enity.TempTotalMoney;
import com.group54.enity.VipOrder;
import com.group54.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

@Service
public class OrderServiceImpl implements OrderService{

    @Autowired
    private OrderDao orderDao=null;


    @Override
    @Transactional(isolation = Isolation.READ_COMMITTED, propagation = Propagation.REQUIRED)
    public List<String> getEmployeeName() {
        return orderDao.getEmployeeName();
    }

    @Override
    @Transactional(isolation = Isolation.READ_COMMITTED, propagation = Propagation.REQUIRED)
    public List<String> getProductName() {
        return orderDao.getProductName();
    }

    @Override
    @Transactional(isolation = Isolation.READ_COMMITTED, propagation = Propagation.REQUIRED)
    public int getTotalMoney(String[] params) {
        List<Integer> priceList=new ArrayList<>();
        int totalMoney=0;
        for (int i=0;i<params.length;i++){
            priceList.add( orderDao.getProductPrice(params[i]));
        }
        for (int i=0;i<priceList.size();i++){
            totalMoney=totalMoney+priceList.get(i);
        }
        return totalMoney;
    }

    @Override
    @Transactional(isolation = Isolation.READ_COMMITTED, propagation = Propagation.REQUIRED)
    public List<OrderList> getPreOrderList() {
        return orderDao.getPreOrderList();
    }

    @Override
    @Transactional(isolation = Isolation.READ_COMMITTED, propagation = Propagation.REQUIRED)
    public List<OrderList> getDoneOrderList() {
        return orderDao.getDoneOrderList();
    }

    @Override
    @Transactional(isolation = Isolation.READ_COMMITTED, propagation = Propagation.REQUIRED)
    public boolean createPreorder(String[] params) {
        boolean flag=false;
        String[] productName=getProductName(params[4]);
        int id=Integer.parseInt(params[0]);
        String date=params[1];
        int employeeId=orderDao.getEmployeeId(params[2]);
        int totalMoney=Integer.parseInt(params[3]);
        int status=0;
        List<Order> orders=new ArrayList<>();
        orderDao.insertTempMoney(new TempTotalMoney(id,totalMoney));
        for (int i=0;i<productName.length;i++){
           orders.add(new Order(id+i,date,employeeId,orderDao.getProductId(productName[i]),status,orderDao.getProductPrice(productName[i])));
        }
        for (int i=0;i<orders.size();i++){
            orderDao.createPreOrder(orders.get(i));
            flag=true;
        }
        return flag;
    }

    @Override
    @Transactional(isolation = Isolation.READ_COMMITTED, propagation = Propagation.REQUIRED)
    public boolean createDoneOrder(String[] params) {
        boolean flag=false;
        String[] productName=getProductName(params[4]);
        int id=Integer.parseInt(params[0]);
        String date=params[1];
        int employeeId=orderDao.getEmployeeId(params[2]);
        int status=1;//订单状态为1
        List<Order> orders=new ArrayList<>();
        for (int i=0;i<productName.length;i++){
            orders.add(new Order(id+i,date,employeeId,orderDao.getProductId(productName[i]),status,orderDao.getProductPrice(productName[i])));
        }
        for (int i=0;i<orders.size();i++){
            orderDao.createPreOrder(orders.get(i));
            flag=true;
        }
        return flag;
    }

    @Override
    @Transactional(isolation = Isolation.READ_COMMITTED, propagation = Propagation.REQUIRED)
    public boolean changeStatus(String param) {
        boolean flag=false;
        if(param.contains("\"")){
            String id=param.replace("\"","");
            orderDao.changeStatus(Integer.parseInt(id));
            orderDao.deleteTempMoney(Integer.parseInt(id));
            orderDao.deleteVipOrder(Integer.parseInt(id));
            flag=true;
        }
        return flag;
    }

    @Override
    @Transactional(isolation = Isolation.READ_COMMITTED, propagation = Propagation.REQUIRED)
    public boolean deletePreOrder(String param) {
        boolean flag=false;
        if(param.contains("\"")){
            String id=param.replace("\"","");
            orderDao.deleteOrder(Integer.parseInt(id));
            orderDao.deleteTempMoney(Integer.parseInt(id));
            flag=true;
        }
        return flag;
    }

    @Override
    @Transactional(isolation = Isolation.READ_COMMITTED, propagation = Propagation.REQUIRED)
    public boolean deleteDoneOrder(String param) {
        boolean flag=false;
        if(param.contains("\"")){
            String id=param.replace("\"","");
            orderDao.deleteOrder(Integer.parseInt(id));
            flag=true;
        }
        return flag;
    }

    @Override
    @Transactional(isolation = Isolation.READ_COMMITTED, propagation = Propagation.REQUIRED)
    public int getOrderIdByGrade(String param) {
          int  grade=Integer.parseInt(param.replace("\"",""));
        return getOrderId(grade);
    }


    @Override
    @Transactional(isolation = Isolation.READ_COMMITTED, propagation = Propagation.REQUIRED)
    public List<TempTotalMoney> showTempMoneyList() {
        return orderDao.getTempMoney();
    }

    @Override
    @Transactional(isolation = Isolation.READ_COMMITTED, propagation = Propagation.REQUIRED)
    public List<VipOrder> showVipOrder() {
        return orderDao.getVipOrder();
    }

    @Override
    public boolean insertVipOrder(String[] params) {
        int orderId=Integer.parseInt(params[0]);
        int vipId=Integer.parseInt(params[1]);
        String name=params[2];
        String phone=params[3];
        String time=params[4];
        int money=Integer.parseInt(params[5]);
        return orderDao.createVipOrder(new VipOrder(orderId,vipId,time,name,phone,money));
    }


    //转换前端传来的productName的值，使其成为我们想要的格式
    private String[] getProductName(String productName){
        String msg=productName.replace("[","");
        String msg1=msg.replace("]"," ");
        String msg2=msg1.replace("," ,"");
        return msg2.split(" ");
    }

    private int getOrderId(int grade){
        switch (grade){
            case 0: {
                boolean flag=false;
                int num=0;
                while (!flag) {
                    num = (int) (Math.random() * 10000000);
                    if (num >= 400000&&num <= 999950) {
                        flag = true;
                    }
                }
                return num;
            }
            case 1:
            {
                boolean flag=false;
                int num=0;
                while (!flag){
                    num= (int)(Math.random()*10000000);
                    if(num>=300000&&num<=399950){
                        flag=true;
                    }
                }return  num;

            }
            case 2:
            {
                boolean flag=false;
                int num=0;
                while (!flag){
                    num= (int)(Math.random()*10000000);
                    if(num>=200000&&num<=299950){
                        flag=true;
                    }
                }return num;

            }
            case 3:
            {
                boolean flag=false;
                int num=0;
                while (!flag){
                    num= (int)(Math.random()*10000000);
                    if(num>=100000&&num<=199950){
                        flag=true;
                    }
                }return num;

            }
            default:
                System.out.println("none");
                return 0;

        }
    }

}
