package com.group54.dao;

import com.group54.enity.Role;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface RoleDao {
    public List<Role> getAllRole();
    public Role getRole(int id);
    public String getRoleName(int id);
    public boolean updateRoleName(@Param("id") int id, @Param("roleName") String roleName);
    public boolean insertRole(Role role);
    public boolean deleteRole(int id);
}
