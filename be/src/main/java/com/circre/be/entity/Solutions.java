package com.circre.be.entity;

/**
 * {@code @BelongsProject:}be
 * {@code @BelongsPackage:}com.circre.be.entity
 * {@code @Author:} Xukai
 * {@code @CreateTime:}2025-07-26  19:36
 * {@code @Description:}TODO
 * {@code @Version:}1.0
 */
import lombok.Builder;
import lombok.Data;

import java.time.LocalDateTime;

/**
 * 解决方案实体类
 */
@Data
@Builder
public class Solutions {
    private Long sessionId;             // 关联会话ID
    private Integer materialId;         // 关联材料ID
    private LocalDateTime createdAt;    // 创建时间
}