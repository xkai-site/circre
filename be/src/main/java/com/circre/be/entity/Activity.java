package com.circre.be.entity;

import lombok.Builder;
import lombok.Data;

import java.time.LocalDateTime;

/**
 * {@code @BelongsProject:}be
 * {@code @BelongsPackage:}com.circre.be.entity
 * {@code @Author:} Xukai
 * {@code @CreateTime:}2025-07-26  13:29
 * {@code @Description:}TODO
 * {@code @Version:}1.0
 */
@Data
@Builder
public class Activity {
    private Integer id;               // 活动ID
    private Integer communityId;      // 组织社区ID
    private Integer materialId;       // 使用材料
    private String recruitmentType;   // 招募人员类型
    private String theme;             // 主题
    private String description;       // 介绍
    private Integer status;           // 活动状态(0:未开始,1:进行中,2:已结束)
    private LocalDateTime createdAt;  // 创建时间
    private LocalDateTime updatedAt;  // 更新时间
}