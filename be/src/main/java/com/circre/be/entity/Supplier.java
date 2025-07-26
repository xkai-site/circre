package com.circre.be.entity;

import lombok.Builder;
import lombok.Data;

import java.time.LocalDateTime;

/**
 * {@code @BelongsProject:}be
 * {@code @BelongsPackage:}com.circre.be.entity
 * {@code @Author:} Xukai
 * {@code @CreateTime:}2025-07-26  12:08
 * {@code @Description:}TODO
 * {@code @Version:}1.0
 */
@Data
@Builder
public class Supplier {
    private Integer id;                  // 供应商ID
    private String name;                // 厂商名称
    private String contact;             // 联系方式
    private String region;              // 地区
    private String orderCycle;         // 订购周期
    private String deliveryScope;      // 配送范围(1:东 2:西 3:南 4:北 5:中)
    private String deliveryMethod;     // 配送方式(海1 陆2 空3)
    private LocalDateTime createdAt;   // 创建时间
    private LocalDateTime updatedAt;   // 更新时间
}