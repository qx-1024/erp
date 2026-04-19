package com.qiu.system.controller;

import com.qiu.system.entity.LoginRequest;
import com.qiu.system.entity.Response;
import com.qiu.system.entity.User;
import com.qiu.system.service.UserService;
import cn.dev33.satoken.stp.StpUtil;
import jakarta.annotation.Resource;
import jakarta.validation.Valid;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.Map;

/**
 * 登录控制器
 */
@RestController
@RequestMapping("/login")
public class LoginController {

    @Resource
    private UserService userService;

    /**
     * 登录请求
     */
    @PostMapping
    public Response<Map<String, Object>> login(@Valid @RequestBody LoginRequest request) {
        // 根据用户名和租户ID查询用户
        User user = userService.getByUsernameAndTenantId(request.getUsername(), request.getTenantId());
        
        if (user == null) {
            return Response.error("用户名或密码错误");
        }
        
        // 这里应该进行密码验证，实际项目中应该使用加密后的密码进行比较
        if (!request.getPassword().equals(user.getPassword())) {
            return Response.error("用户名或密码错误");
        }
        
        // 登录成功，生成token
        StpUtil.login(user.getId());
        String token = StpUtil.getTokenValue();
        
        // 存储用户信息到Redis
        StpUtil.getSession().set("user", user);
        StpUtil.getSession().set("tenantId", user.getTenantId());
        
        // 返回token和用户信息
        Map<String, Object> result = new HashMap<>();
        result.put("token", token);
        result.put("user", user);
        
        return Response.success(result);
    }

    /**
     * 登出请求
     */
    @PostMapping("/logout")
    public Response<Void> logout() {
        StpUtil.logout();
        return Response.success();
    }

}
