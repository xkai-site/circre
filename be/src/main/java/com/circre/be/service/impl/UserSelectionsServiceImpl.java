package com.circre.be.service.impl;

import com.circre.be.entity.UserSelections;
import com.circre.be.mapper.UserSelectionsMapper;
import com.circre.be.service.UserSelectionsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * {@code @BelongsProject:}be
 * {@code @BelongsPackage:}com.circre.be.service.impl
 * {@code @Author:} Xukai
 * {@code @CreateTime:}2025-07-27  03:27
 * {@code @Description:}TODO
 * {@code @Version:}1.0
 */
@Service
public class UserSelectionsServiceImpl implements UserSelectionsService {
    @Autowired
    private UserSelectionsMapper userSelectionsMapper;
    public void addSelections(UserSelections userSelections) {
        if (userSelections.getUserId() == null || userSelections.getSessionId() == null) {
            throw new IllegalArgumentException("userId, sessionId are required");
        }
        //先查询SessionId是否存在，存在就更新
        if (userSelectionsMapper.getSelectionsBySessionId(userSelections.getSessionId())) {
            userSelectionsMapper.updateSelections(userSelections);
        } else {    //若不存在就插入
            userSelectionsMapper.insertSelections(userSelections);
        }
    }
}
