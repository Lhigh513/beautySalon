package com.group54.dao;

import com.group54.enity.Customer;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CustomerDao {
    public List<Customer> getAllCustomer();
    public Customer getCustomer(int id);
    public boolean deleteCustomer(int id);
    public boolean updateCustomer(Customer customer);
    public boolean insertCustomer(Customer customer);

}
