package com.group54.dao;

import com.group54.enity.Vip;
import org.springframework.stereotype.Repository;
import java.util.List;
@Repository
public interface VipCustomerDao {
    public List<Vip> getAllVip();
    public Vip getCustomer(int id);
    public boolean deleteCustomer(int id);
    public boolean updateCustomer(Vip vip);
    public boolean insertCustomer(Vip vip);

}
