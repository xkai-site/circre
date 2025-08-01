package com.circre.be.entity;

import lombok.Data;

import java.io.Serializable;

/**
 * {@code @BelongsProject:}be
 * {@code @BelongsPackage:}com.circre.be.entity
 * {@code @Author:} Xukai
 * {@code @CreateTime:}2025-07-26  10:57
 * {@code @Description:}TODO
 * {@code @Version:}1.0
 */
@Data
public class Result<T> implements Serializable {

    private Integer code;   //编码：1成功，0和其它数字为失败
    private String msg;     //错误信息
    private T data;         //数据

    public static <T> Result<T> success() {
        Result<T> result = new Result<T>();
        result.code = 1;
        return result;
    }
    //成功时需要返回数据
    public static <T> Result<T> success(T object) {
        Result<T> result = new Result<T>();
        result.data = object;
        result.code = 1;
        return result;
    }

    public static <T> Result<T> error(String msg) {
        Result result = new Result();
        result.msg = msg;
        result.code = 0;
        return result;
    }

}
