package com.circre.be.mapper;

import com.circre.be.entity.Material;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface MaterialMapper {
    Material getMaterialById(Integer id);
    //批量查询材料
    List<Material> getMaterialsByIds(List<Integer> materialIds);
    //根据类型查询材料
    List<Material> getMaterialByType(String type);
}
