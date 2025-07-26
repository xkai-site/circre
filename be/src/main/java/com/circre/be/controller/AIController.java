package com.circre.be.controller;

import com.circre.be.entity.Activity;
import com.circre.be.entity.Material;
import com.circre.be.entity.Result;
import com.circre.be.entity.Supplier;
import com.circre.be.service.AIService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * {@code @BelongsProject:}be
 * {@code @BelongsPackage:}com.circre.be.controller
 * {@code @Author:} Xukai
 * {@code @CreateTime:}2025-07-26  11:23
 * {@code @Description:AI控制器，接收请求}
 * {@code @Version:}1.0
 */
@RestController
@RequestMapping("/ai")
@Slf4j
public class AIController {
    @Autowired
    private AIService aiService;    //引入AI服务类

    @PostMapping("/recommendMaterial")
    public Result<List<Material>> recommendMaterial(
            @RequestParam Integer designerId,
            @RequestParam String sessionId,
            @RequestParam String question) {
        return Result.success(aiService.recommendMaterial(designerId,sessionId, question));
    }

    @PostMapping("/recommendSupplier")
    public Result<List<Supplier>> recommendSupplier(
            @RequestParam Integer designerId,
            @RequestParam String sessionId,
            @RequestBody List<Integer> materialIds) {
        return Result.success(aiService.recommendSupplier(designerId, sessionId,materialIds));
    }

    @PostMapping("/recommendActivity")
    public Result<List<Activity>> recommendActivity(
            @RequestParam Integer designerId) {
        return Result.success(aiService.recommendActivity(designerId));
    }

}

