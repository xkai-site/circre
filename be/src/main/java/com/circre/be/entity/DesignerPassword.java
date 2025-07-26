package com.circre.be.entity;

/**
 * {@code @BelongsProject:}be
 * {@code @BelongsPackage:}com.circre.be.entity
 * {@code @Author:} Xukai
 * {@code @CreateTime:}2025-07-26  16:14
 * {@code @Description:}TODO
 * {@code @Version:}1.0
 */

import lombok.Data;

/**
 * 设计师密码实体类
 */
@Data
public class DesignerPassword {
    private Integer designerId;   // 设计师ID（关联designer表）
    private String password;     // 密码
}