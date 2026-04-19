package com.qiu.system.service.impl;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.qiu.system.entity.User;
import com.qiu.system.mapper.UserMapper;
import com.qiu.system.service.UserService;
import com.qiu.system.utils.EntityUtil;
import com.qiu.system.utils.SnowflakeUtil;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserServiceImpl extends ServiceImpl<UserMapper, User> implements UserService {

    @Override
    public User saveUser(User user, Long currentUserId, String currentUserName, Long currentOrgId, Long currentTenantId) {
        // 设置租户ID
        user.setTenantId(currentTenantId);
        
        // 用户名唯一性校验（按租户ID过滤）
        if (lambdaQuery()
                .eq(User::getUsername, user.getUsername())
                .eq(User::getTenantId, user.getTenantId())
                .eq(User::getIsDel, 0)
                .count() > 0) {
            throw new RuntimeException("用户名已存在");
        }
        
        // 设置默认值
        if (user.getLanguagePreference() == null) {
            user.setLanguagePreference("zh-CN");
        }
        if (user.getStatus() == null) {
            user.setStatus(1);
        }
        if (user.getIsDel() == null) {
            user.setIsDel(0);
        }
        
        // 设置公共字段
        EntityUtil.setCreateFields(user, currentUserId, currentUserName, currentOrgId);
        
        // 生成雪花算法ID
        user.setId(SnowflakeUtil.generateId());
        
        save(user);
        return user;
    }

    @Override
    public User updateUser(User user, Long currentUserId, String currentUserName, Long currentTenantId) {
        // 前置校验逻辑
        if (user.getId() == null) {
            throw new RuntimeException("用户ID不能为空");
        }
        
        // 检查用户是否存在
        User existingUser = getById(user.getId());
        if (existingUser == null) {
            throw new RuntimeException("用户不存在");
        }
        
        // 验证租户ID是否匹配
        if (!existingUser.getTenantId().equals(currentTenantId)) {
            throw new RuntimeException("无权限修改该用户信息");
        }
        
        // 用户名唯一性校验（排除当前用户，按租户ID过滤）
        if (user.getUsername() != null) {
            long count = lambdaQuery()
                    .eq(User::getUsername, user.getUsername())
                    .eq(User::getTenantId, existingUser.getTenantId())
                    .ne(User::getId, user.getId())
                    .eq(User::getIsDel, 0)
                    .count();
            if (count > 0) {
                throw new RuntimeException("用户名已存在");
            }
        }
        
        // 设置公共字段
        EntityUtil.setUpdateFields(user, currentUserId, currentUserName);
        
        updateById(user);
        return user;
    }

    @Override
    public void removeUser(Long id, Long currentUserId, String currentUserName, Long currentTenantId) {
        // 前置校验逻辑
        if (id == null) {
            throw new RuntimeException("用户ID不能为空");
        }
        
        // 检查用户是否存在
        User user = getById(id);
        if (user == null) {
            throw new RuntimeException("用户不存在");
        }
        
        // 验证租户ID是否匹配
        if (!user.getTenantId().equals(currentTenantId)) {
            throw new RuntimeException("无权限删除该用户信息");
        }
        
        // 设置公共字段（软删除）
        EntityUtil.setDeleteFields(user, currentUserId, currentUserName);
        
        updateById(user);
    }
    
    @Override
    public List<User> listByTenantId(Long tenantId) {
        return lambdaQuery()
                .eq(User::getTenantId, tenantId)
                .eq(User::getIsDel, 0)
                .list();
    }
    
    @Override
    public User getByUsernameAndTenantId(String username, Long tenantId) {
        return lambdaQuery()
                .eq(User::getUsername, username)
                .eq(User::getTenantId, tenantId)
                .eq(User::getIsDel, 0)
                .one();
    }
    
    @Override
    public IPage<User> page(Page<User> page, Long tenantId) {
        return lambdaQuery()
                .eq(User::getTenantId, tenantId)
                .eq(User::getIsDel, 0)
                .page(page);
    }
    
    @Override
    public User getById(Long id, Long tenantId) {
        User user = getById(id);
        if (user == null) {
            throw new RuntimeException("用户不存在");
        }
        
        // 验证租户ID是否匹配
        if (!user.getTenantId().equals(tenantId)) {
            throw new RuntimeException("无权限访问该用户信息");
        }
        
        return user;
    }

}