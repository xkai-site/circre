package com.circre.be.service.impl;

import com.circre.be.entity.Activity;
import com.circre.be.mapper.ActivityMapper;
import com.circre.be.service.ActivityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * {@code @BelongsProject:}be
 * {@code @BelongsPackage:}com.circre.be.service.impl
 * {@code @Author:} Xukai
 * {@code @CreateTime:}2025-07-26  13:35
 * {@code @Description:}TODO
 * {@code @Version:}1.0
 */
@Service
public class ActivityServiceImpl implements ActivityService {
    @Autowired
    private ActivityMapper activityMapper;

    public Activity getActivityById(Integer id) {
        return activityMapper.getActivityById(id);
    }
}
