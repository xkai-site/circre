package com.circre.be.mapper;

import com.circre.be.entity.Activity;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface ActivityMapper {
    //根据id查询活动
    Activity getActivityById(Integer id);
    //批量查询活动
    List<Activity> getActivitiesByIds(List<Integer> ids);
}
