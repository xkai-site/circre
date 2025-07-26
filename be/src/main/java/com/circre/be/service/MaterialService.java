package com.circre.be.service;

import com.circre.be.entity.Material;

import java.util.List;

public interface MaterialService {
    Material getMaterialById(Integer id);

    List<Material> getMaterialByType(String type);
}
