package com.circre.be.mapper;

import com.circre.be.entity.Solutions;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface SolutionsMapper {
    void insert(Solutions solutions);

    //根据sessionId批量查询materialId
    List<Integer> getMaterialIdsBySessionId(Long sessionId);
}
