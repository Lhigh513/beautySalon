package com.group54.service;

import com.group54.enity.OrderList;
import com.group54.enity.TempTotalMoney;
import com.group54.enity.VipOrder;

import java.util.List;

public interface OrderService {
    public List<String> getEmployeeName();
    public List<String> getProductName();
    public int getTotalMoney(String[] params);
    public List<OrderList> getPreOrderList();
    public List<OrderList> getDoneOrderList();
    public boolean createPreorder(String[] params);
    public boolean createDoneOrder(String[] params);
    public boolean changeStatus(String param);
    public boolean deletePreOrder(String param);
    public boolean deleteDoneOrder(String param);
    public int getOrderIdByGrade(String grade);
    public List<TempTotalMoney> showTempMoneyList();
    public List<VipOrder> showVipOrder();
    public boolean insertVipOrder(String[] params);

}
