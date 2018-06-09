package com.group54.service.impl;

import com.group54.dao.MonthChartDao;
import com.group54.enity.MonthChart;
import com.group54.enity.ProductChart;
import com.group54.service.MonthChartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

@Service
public class MonthChartServiceImpl  implements MonthChartService {

    @Autowired
    MonthChartDao monthChartDao=null;

    @Override
    public List<MonthChart> getMonthChart() {
        return monthChart();
    }

    @Override
    @Transactional(isolation = Isolation.READ_COMMITTED, propagation = Propagation.REQUIRED)
    public List<ProductChart> getProductChart() {
        return productCharts();
    }

    private List<MonthChart> monthChart(){
        List<MonthChart> monthCharts=new ArrayList<>();
        for(int i=1;i<=12;i++){
            if(i<=9){
                List<Integer> moneyList=new ArrayList<>();
                moneyList=monthChartDao.getMonthMoney("2018-0"+i);
                int k=0;
                for (int j=0;j<moneyList.size();j++){
                    k=k+moneyList.get(j);
                }monthCharts.add(new MonthChart("2018-"+i,k));
            }
            if(i>=10){
                List<Integer> moneyList=new ArrayList<>();
                moneyList=monthChartDao.getMonthMoney("2018-"+i);
                int k=0;
                for (int j=0;j<moneyList.size();j++){
                    k=k+moneyList.get(j);
                }monthCharts.add(new MonthChart("2018-"+i,k));
            }
        }return monthCharts;
    }
    private List<ProductChart> productCharts(){
        List<String> productList=new ArrayList<>();
        List<String> list=new ArrayList<>();
        list=monthChartDao.getProductName();
        productList=monthChartDao.getProduct();
        List<ProductChart> productCharts=new ArrayList<>();

        for (int i=0;i<productList.size();i++){
            int count=0;
            for (int j=0;j<list.size();j++){
                if(list.get(j).equals(productList.get(i))){
                    count++;
                }
            }
            productCharts.add(new ProductChart(productList.get(i),count));

        }
       return productCharts;
    }
}
