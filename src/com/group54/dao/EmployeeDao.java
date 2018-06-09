package com.group54.dao;

import com.group54.enity.Employee;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface EmployeeDao {
    public List<Employee> getAllEmployee();
    public List<Integer> getEmployeeId();
    public List<String> getRoleName();
    public int getRoleId(int id);
    public int getRoleIdByRoleName(String roleName);
    public String getPassword(int id);
    public boolean updateEmployee(Employee employee);
    public boolean insertEmployee(Employee employee);
    public boolean deleteEmployee(int id);
}
