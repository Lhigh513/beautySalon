package com.group54.dao;


import com.group54.enity.User;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface UserDao {
    public List<User> getAllUsers();
    public User getUser(int id);
    public String getName(int id);
    public String getPassword(String name);
    public boolean updatePassword(@Param("id") int id, @Param("password") String password);
    public boolean insertUser(User user);
    public boolean deleteUser(int id);

}
