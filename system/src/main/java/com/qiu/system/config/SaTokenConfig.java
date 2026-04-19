package com.qiu.system.config;

import cn.dev33.satoken.interceptor.SaInterceptor;
import cn.dev33.satoken.stp.StpUtil;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

/**
 * Sa-Token配置类
 */
@Configuration
public class SaTokenConfig implements WebMvcConfigurer {

    /**
     * 注册Sa-Token拦截器
     */
    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        // 注册Sa-Token拦截器，拦截所有请求
        registry.addInterceptor(new SaInterceptor(handler -> {
            // 登录校验 -- 拦截所有路径，除了登录和登出
            StpUtil.checkLogin();
        }))
        .addPathPatterns("/**")
        .excludePathPatterns("/login", "/login/logout");
    }

}
