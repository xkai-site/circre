package com.circre.be.entity;

/**
 * {@code @BelongsProject:}be
 * {@code @BelongsPackage:}com.circre.be.entity
 * {@code @Author:} Xukai
 * {@code @CreateTime:}2025-07-26  09:30
 * {@code @Description:}TODO
 * {@code @Version:}1.0
 */

import lombok.Builder;
import lombok.Data;

import java.time.LocalDateTime;

/**
 * 材料实体类
 */
@Data
@Builder
public class Material {
    private Integer id;                // 材料ID
    private String name;               // 材料名
    private String category;           // 材料类别
    private String description;        // 材料介绍
    private String image;              // 图片路径
    private String texture;            // 材料纹理
    private String formula;            // 配方
    private String physicalStructure;  // 物理结构
    private Integer sustainabilityScore; // 可持续性评分（1-5星）
    private String mainAttribute;      // 主要属性（最显著的属性）
    private LocalDateTime createdAt;   // 创建时间
    private LocalDateTime updatedAt;   // 更新时间
}