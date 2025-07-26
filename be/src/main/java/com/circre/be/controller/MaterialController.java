package com.circre.be.controller;

import com.circre.be.entity.Material;
import com.circre.be.entity.Result;
import com.circre.be.service.MaterialService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * {@code @BelongsProject:}be
 * {@code @BelongsPackage:}com.circre.be.controller
 * {@code @Author:} Xukai
 * {@code @CreateTime:}2025-07-26  11:01
 * {@code @Description:}TODO
 * {@code @Version:}1.0
 */
@Slf4j
@RestController
@RequestMapping("/material")
public class MaterialController {
    @Autowired
    private MaterialService materialService;

    //根据id查询材料信息
    @GetMapping("/id/{id}")
    public Result<Material> getMaterialById(@PathVariable("id") Integer id) {
        log.info("根据id查询材料信息");
        return Result.success(materialService.getMaterialById(id));
    }

    //根据类型名查询材料信息
    @GetMapping("/type")
    public Result<List<Material>> getMaterialByType(@RequestParam("type") String type) {
        log.info("根据类型名查询材料信息");
        return Result.success(materialService.getMaterialByType(type));
    }
}
