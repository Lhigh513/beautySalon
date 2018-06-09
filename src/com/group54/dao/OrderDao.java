package com.group54.dao;

import com.group54.enity.Order;
import com.group54.enity.OrderList;
import com.group54.enity.TempTotalMoney;
import com.group54.enity.VipOrder;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface OrderDao {
    public List<String> getCategoryName();
    public List<String> getProductName();
    public List<String> getEmployeeName();
    public String getCategoryNameByid(int id);
    public String getProductNameByid(int id);
    public String getEmployeeNameByid(int id);
    public int getProductPrice(String params);
    public int getProductStatusById(int id);
    public List<OrderList> getPreOrderList();
    public List<OrderList> getDoneOrderList();
    public boolean createPreOrder(Order order);
    public int getProductId(String productName);
    public int getEmployeeId(String name);
    public boolean changeStatus(int id);
    public boolean deleteOrder(int id);
    /*对总价格提示tempmoney对dao*/
    public List<TempTotalMoney> getTempMoney();
    public boolean insertTempMoney(TempTotalMoney tempTotalMoney);
    public boolean deleteTempMoney(int id);
    /*对viporder的dao*/
    public List<VipOrder> getVipOrder();
    public boolean createVipOrder(VipOrder vipOrder);
    public boolean deleteVipOrder(int id);

}
