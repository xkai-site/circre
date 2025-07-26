package com.circre.be.service.impl;

import com.circre.be.entity.Material;
import com.circre.be.entity.Result;
import com.circre.be.mapper.MaterialMapper;
import com.circre.be.service.MaterialService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * {@code @BelongsProject:}be
 * {@code @BelongsPackage:}com.circre.be.service.impl
 * {@code @Author:} Xukai
 * {@code @CreateTime:}2025-07-26  11:01
 * {@code @Description:}TODO
 * {@code @Version:}1.0
 */
@Service
public class MaterialServiceImpl implements MaterialService {
    @Autowired
    private MaterialMapper materialMapper;
    //根据id查询材料信息
    public Material getMaterialById(Integer id) {
        return materialMapper.getMaterialById(id);
    }

    public List<Material> getMaterialByType(String type) {
        return materialMapper.getMaterialByType(type);
    }
}
