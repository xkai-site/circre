package com.circre.be.entity;

import lombok.Data;

import java.time.LocalDateTime;

/**
 * {@code @BelongsProject:}be
 * {@code @BelongsPackage:}com.circre.be.entity
 * {@code @Author:} Xukai
 * {@code @CreateTime:}2025-07-26  16:20
 * {@code @Description:}TODO
 * {@code @Version:}1.0
 */
@Data
public class DesignerVO {
    // 来自Designer的字段
    private Integer id;
    private String name;
    private String avatar;
    private Integer region;
    private String contact;
    private String industry;
    private String specialization;
    private Integer identityTagId;

    // 来自DesignerPassword的字段
    private String password;
}
