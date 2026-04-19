package com.qiu.system.entity;

import lombok.Data;

import java.time.LocalDateTime;

/**
 * 统一响应格式
 */
@Data
public class Response<T> {

    /**
     * 响应状态码
     */
    private int code;

    /**
     * 响应消息
     */
    private String message;

    /**
     * 响应数据
     */
    private T data;

    /**
     * 响应时间戳
     */
    private LocalDateTime timestamp;

    public Response() {
        this.timestamp = LocalDateTime.now();
    }

    public Response(int code, String message, T data) {
        this.code = code;
        this.message = message;
        this.data = data;
        this.timestamp = LocalDateTime.now();
    }

    /**
     * 成功响应
     */
    public static <T> Response<T> success(T data) {
        return new Response<>(200, "success", data);
    }

    /**
     * 成功响应（无数据）
     */
    public static <T> Response<T> success() {
        return new Response<>(200, "success", null);
    }

    /**
     * 失败响应
     */
    public static <T> Response<T> error(int code, String message) {
        return new Response<>(code, message, null);
    }

    /**
     * 失败响应（默认状态码）
     */
    public static <T> Response<T> error(String message) {
        return new Response<>(500, message, null);
    }

}