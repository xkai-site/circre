package com.circre.be.controller;

import com.circre.be.entity.Result;
import com.circre.be.entity.Supplier;
import com.circre.be.service.SupplierService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

/**
 * {@code @BelongsProject:}be
 * {@code @BelongsPackage:}com.circre.be.controller
 * {@code @Author:} Xukai
 * {@code @CreateTime:}2025-07-26  12:21
 * {@code @Description:}TODO
 * {@code @Version:}1.0
 */
@RestController
@RequestMapping("/supplier")
@Slf4j
public class SupplierController {
    @Autowired
    private SupplierService supplierService;

    //查询供应商信息
    @GetMapping("/{id}")
    public Result<Supplier> getSupplierById(@PathVariable("id") Integer id) {
        log.info("根据id查询供应商信息");
        return Result.success(supplierService.getSupplierById(id));
    }
}
