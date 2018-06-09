package com.group54.service;

import com.group54.enity.MonthChart;
import com.group54.enity.ProductChart;

import java.util.List;

public interface MonthChartService {
    public List<MonthChart> getMonthChart();
    public List<ProductChart> getProductChart();
}
