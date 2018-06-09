import com.group54.dao.CategoryDao;
import com.group54.dao.MonthChartDao;
import com.group54.dao.OrderDao;
import com.group54.dao.ProductDao;
import com.group54.enity.*;
import com.group54.service.CustomerService;
import com.group54.service.MonthChartService;
import com.group54.service.ProductService;
import com.group54.service.impl.MonthChartServiceImpl;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.util.ArrayList;
import java.util.List;

public class test {

    @Test
    public void test() {
        ApplicationContext ctx = new ClassPathXmlApplicationContext("applicationContext.xml");
        MonthChartDao monthChartDao=ctx.getBean(MonthChartDao.class);
        List<String> cateList=new ArrayList<>();
        List<String> list=new ArrayList<>();
        list=monthChartDao.getProductName();
        cateList=monthChartDao.getProduct();
        List<Integer> countlist=new ArrayList<>();
        List<ProductChart> productCharts=new ArrayList<>();

        for (int i=0;i<cateList.size();i++){
            int count=0;
            for (int j=0;j<list.size();j++){
                if(list.get(j).equals(cateList.get(i))){
                    count++;
                }
            }
            productCharts.add(new ProductChart(cateList.get(i),count));
            countlist.add(count);
        }
        System.out.println(countlist.size());
        System.out.println(productCharts.size());
    }




}
