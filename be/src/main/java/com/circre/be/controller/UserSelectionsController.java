package com.circre.be.controller;

import com.circre.be.entity.Result;
import com.circre.be.entity.UserSelections;
import com.circre.be.mapper.UserSelectionsMapper;
import com.circre.be.service.UserSelectionsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * {@code @BelongsProject:}be
 * {@code @BelongsPackage:}com.circre.be.controller
 * {@code @Author:} Xukai
 * {@code @CreateTime:}2025-07-27  03:08
 * {@code @Description:}TODO
 * {@code @Version:}1.0
 */
@RestController
@RequestMapping("/userSelections")

public class UserSelectionsController {

    @Autowired
    private UserSelectionsService userSelectionsService;
    //此处前端需维护UserSelections表，即前端每次访问时，需传入sessionId和materialId
    @PostMapping("/addSelections")
    public Result addSelections(@RequestBody UserSelections userSelections) {
        userSelectionsService.addSelections(userSelections);
        return Result.success();
    }
}
