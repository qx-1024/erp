package com.qiu.system.controller;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.qiu.system.entity.Response;
import com.qiu.system.entity.User;
import com.qiu.system.service.UserService;
import com.qiu.system.utils.UserContext;
import cn.dev33.satoken.annotation.SaCheckLogin;
import jakarta.annotation.Resource;
import jakarta.validation.Valid;
import org.springframework.web.bind.annotation.*;

/**
 * 用户管理控制器
 */
@RestController
@RequestMapping("/user")
public class UserController {

    @Resource
    private UserService userService;

    /**
     * 新增用户
     */
    @PostMapping
    @SaCheckLogin
    public Response<User> save(@Valid @RequestBody User user) {
        // 从UserContext获取当前用户信息
        Long currentUserId = UserContext.getCurrentUserId();
        String currentUserName = UserContext.getCurrentUserName();
        Long currentOrgId = UserContext.getCurrentOrgId();
        Long currentTenantId = UserContext.getCurrentTenantId();
        
        User savedUser = userService.saveUser(user, currentUserId, currentUserName, currentOrgId, currentTenantId);
        return Response.success(savedUser);
    }

    /**
     * 查询用户列表
     */
    @GetMapping
    @SaCheckLogin
    public Response<IPage<User>> list(
            @RequestParam(defaultValue = "1") Integer page,
            @RequestParam(defaultValue = "10") Integer size) {
        // 从UserContext获取当前用户的租户ID
        Long currentTenantId = UserContext.getCurrentTenantId();
        
        IPage<User> userPage = userService.page(new Page<>(page, size), currentTenantId);
        return Response.success(userPage);
    }

    /**
     * 查询用户详情
     */
    @GetMapping("/{id}")
    @SaCheckLogin
    public Response<User> getById(@PathVariable Long id) {
        // 从UserContext获取当前用户的租户ID
        Long currentTenantId = UserContext.getCurrentTenantId();
        
        User user = userService.getById(id, currentTenantId);
        return Response.success(user);
    }

    /**
     * 更新用户
     */
    @PutMapping
    @SaCheckLogin
    public Response<User> update(@Valid @RequestBody User user) {
        // 从UserContext获取当前用户信息
        Long currentUserId = UserContext.getCurrentUserId();
        String currentUserName = UserContext.getCurrentUserName();
        Long currentTenantId = UserContext.getCurrentTenantId();
        
        User updatedUser = userService.updateUser(user, currentUserId, currentUserName, currentTenantId);
        return Response.success(updatedUser);
    }

    /**
     * 删除用户
     */
    @DeleteMapping("/{id}")
    @SaCheckLogin
    public Response<Void> remove(@PathVariable Long id) {
        // 从UserContext获取当前用户信息
        Long currentUserId = UserContext.getCurrentUserId();
        String currentUserName = UserContext.getCurrentUserName();
        Long currentTenantId = UserContext.getCurrentTenantId();
        
        userService.removeUser(id, currentUserId, currentUserName, currentTenantId);
        return Response.success();
    }

}