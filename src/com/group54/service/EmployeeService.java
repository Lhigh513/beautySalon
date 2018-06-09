package com.group54.service;

import com.group54.enity.Employee;
import org.springframework.stereotype.Service;

import java.util.List;


public interface EmployeeService {
    public List<Employee> showEmployee();
    public boolean updateEmployee(String[] params);
    public boolean deleteEmployee(String param);
    public boolean insertEmployee(String[] params);
    public List<String> getRoleName();
}
