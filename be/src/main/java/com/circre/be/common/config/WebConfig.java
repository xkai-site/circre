package com.circre.be.common.config;

/**
 * {@code @BelongsProject:}be
 * {@code @BelongsPackage:}com.circre.be.common.config
 * {@code @Author:} Xukai
 * {@code @CreateTime:}2025-07-27  01:47
 * {@code @Description:}TODO
 * {@code @Version:}1.0
 */

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.CorsRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebConfig implements WebMvcConfigurer {
    @Override
    public void addCorsMappings(CorsRegistry registry) {
        registry.addMapping("/**")
                .allowedOriginPatterns("*")
                //.allowedOrigins("http://localhost:3000") // 前端地址，测试阶段暂时允许所有地址
                .allowedMethods("*")
                .allowCredentials(true);
    }
}
