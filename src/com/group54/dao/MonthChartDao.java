package com.group54.dao;


import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface MonthChartDao {
public List<Integer> getMonthMoney(String month);
public List<String> getProductName();
public List<String> getProduct();
}
//select product.productName from `order` left join(`product`)on(order.productId=product.id) where order.status=1;