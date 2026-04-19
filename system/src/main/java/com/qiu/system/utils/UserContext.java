package com.qiu.system.utils;

import com.qiu.system.entity.User;
import cn.dev33.satoken.stp.StpUtil;

/**
 * 用户上下文工具类，用于获取当前登录用户的信息
 */
public class UserContext {

    /**
     * 获取当前登录用户的ID
     */
    public static Long getCurrentUserId() {
        if (StpUtil.isLogin()) {
            return (Long) StpUtil.getLoginId();
        }
        return null;
    }

    /**
     * 获取当前登录用户的信息
     */
    public static User getCurrentUser() {
        if (StpUtil.isLogin()) {
            return (User) StpUtil.getSession().get("user");
        }
        return null;
    }

    /**
     * 获取当前登录用户的用户名
     */
    public static String getCurrentUserName() {
        User user = getCurrentUser();
        if (user != null) {
            return user.getName();
        }
        return null;
    }

    /**
     * 获取当前登录用户的租户ID
     */
    public static Long getCurrentTenantId() {
        if (StpUtil.isLogin()) {
            return (Long) StpUtil.getSession().get("tenantId");
        }
        return null;
    }

    /**
     * 获取当前登录用户的组织ID
     */
    public static Long getCurrentOrgId() {
        User user = getCurrentUser();
        if (user != null) {
            return user.getOrgId();
        }
        return null;
    }

    /**
     * 检查用户是否已登录
     */
    public static boolean isLogin() {
        return StpUtil.isLogin();
    }

    /**
     * 检查用户是否具有指定角色
     */
    public static boolean hasRole(String role) {
        return StpUtil.hasRole(role);
    }

    /**
     * 检查用户是否具有指定权限
     */
    public static boolean hasPermission(String permission) {
        return StpUtil.hasPermission(permission);
    }

}
