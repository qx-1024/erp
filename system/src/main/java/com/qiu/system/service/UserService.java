package com.qiu.system.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.IService;
import com.qiu.system.entity.User;

import java.util.List;

public interface UserService extends IService<User> {

    /**
     * 新增用户
     */
    User saveUser(User user, Long currentUserId, String currentUserName, Long currentOrgId, Long currentTenantId);

    /**
     * 更新用户
     */
    User updateUser(User user, Long currentUserId, String currentUserName, Long currentTenantId);

    /**
     * 删除用户
     */
    void removeUser(Long id, Long currentUserId, String currentUserName, Long currentTenantId);

    /**
     * 根据租户ID查询用户列表
     */
    List<User> listByTenantId(Long tenantId);

    /**
     * 根据租户ID和用户名查询用户
     */
    User getByUsernameAndTenantId(String username, Long tenantId);
    
    /**
     * 根据租户ID分页查询用户列表
     */
    IPage<User> page(Page<User> page, Long tenantId);
    
    /**
     * 根据ID和租户ID查询用户
     */
    User getById(Long id, Long tenantId);

}