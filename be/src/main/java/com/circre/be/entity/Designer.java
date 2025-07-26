package com.circre.be.entity;

/**
 * {@code @BelongsProject:}be
 * {@code @BelongsPackage:}com.circre.be.entity
 * {@code @Author:} Xukai
 * {@code @CreateTime:}2025-07-26  09:12
 * {@code @Description:}设计师类
 * {@code @Version:}1.0
 */
import lombok.Data;

import java.time.LocalDateTime;

/**
 * 设计师实体类
 */
@Data
public class Designer {
    private Integer id;                 // 设计师ID
    private String name;                // 名字
    private String avatar;              // 头像URL
    private Integer region;             // 地区(1:东 2:西 3:南 4:北 5:中)
    private String contact;             // 联系方式
    private String industry;            // 行业
    private String specialization;      // 领域方向
    private Integer identityTagId;      // 身份标签ID
    private LocalDateTime createdAt;    // 创建时间
    private LocalDateTime updatedAt;    // 更新时间
}