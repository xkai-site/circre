package com.circre.be.entity;

import lombok.Builder;
import lombok.Data;

import java.time.LocalDateTime;
import java.util.List;

/**
 * {@code @BelongsProject:}be
 * {@code @BelongsPackage:}com.circre.be.entity
 * {@code @Author:} Xukai
 * {@code @CreateTime:}2025-07-27  03:00
 * {@code @Description:}TODO
 * {@code @Version:}1.0
 */
@Data
@Builder
public class UserSelections {
    private Integer id;             // 自增主键
    private Integer userId;         // 用户标识
    private String sessionId;       // 会话标识
    private List<Integer> selectedIds; // 用户选择的ID列表(JSON数组格式)
    private LocalDateTime createdAt; // 选择时间
}
