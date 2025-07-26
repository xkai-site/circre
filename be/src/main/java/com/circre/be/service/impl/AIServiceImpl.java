package com.circre.be.service.impl;

import com.circre.be.common.utils.AIUtil;
import com.circre.be.entity.*;
import com.circre.be.mapper.*;
import com.circre.be.service.AIService;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

import java.time.LocalDateTime;
import java.util.Collections;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * {@code @BelongsProject:}be
 * {@code @BelongsPackage:}com.circre.be.service.impl
 * {@code @Author:} Xukai
 * {@code @CreateTime:}2025-07-26  11:26
 * {@code @Description:}TODO
 * {@code @Version:}1.0
 */
@Slf4j
@Service
public class AIServiceImpl implements AIService {
    // 注入材料库专用的AIUtil
    @Autowired
    @Qualifier("materialsAI")
    private AIUtil materialsAI;
    // 注入供应商库专用的AIUtil
    @Autowired
    @Qualifier("suppliersAI")
    private AIUtil suppliersAI;
    //注入活动库专用的AIUtil
    @Autowired
    @Qualifier("activitiesAI")
    private AIUtil activitiesAI;

    @Autowired
    private MaterialMapper materialMapper;  //查询材料
    @Autowired
    private DesignerMapper designerMapper;  //查询设计师
    @Autowired
    private SupplierMapper supplierMapper;  //查询供应商
    @Autowired
    private ActivityMapper activityMapper;  //查询活动

    @Autowired
    private UserSelectionsServiceImpl userSelectionsService;

    public List<Material> recommendMaterial(Integer designerId, String sessionId, String question) {
        //装填用户选择记录
        UserSelections userSelections = UserSelections.builder()
                .userId(designerId)
                .sessionId(sessionId)
                .createdAt(LocalDateTime.now())
                .build();
        userSelectionsService.addSelections(userSelections);

        try {
            // 0. 获取设计师信息
            Designer designer = designerMapper.getDesignerById(designerId);

            // 1. 获取AI推荐响应
            String aiResponse = materialsAI.recommendMaterial("设计师信息:" + designer + "设计师问题:" + question);

            // 2. 解析JSON响应
            ObjectMapper mapper = new ObjectMapper();
            List<Integer> materialIds = mapper.readValue(aiResponse, new TypeReference<List<Integer>>(){});

            // 3. 查询材料详情
            return materialMapper.getMaterialsByIds(materialIds);
        } catch (Exception e) {
            log.error("Failed to recommend materials", e);
            return null;
        }

    }

    public List<Supplier> recommendSupplier(Integer designerId,String sessionId, List<Integer> materialIds) {
        //装填用户选择记录
        UserSelections userSelections = UserSelections.builder()
                .userId(designerId)
                .sessionId(sessionId)
                .createdAt(LocalDateTime.now())
                .build();
        userSelectionsService.addSelections(userSelections);
        try {
            // 0. 获取设计师信息 + 已选材料信息
            Designer designer = designerMapper.getDesignerById(designerId);
            List<Material> materials = materialMapper.getMaterialsByIds(materialIds);

            // 1. 获取AI推荐响应
            String aiResponse = suppliersAI.recommendSupplier("设计师信息:" + designer + "材料信息:" + materials);

            // 2. 解析JSON响应
            ObjectMapper mapper = new ObjectMapper();
            List<Integer> supplierIds = mapper.readValue(aiResponse, new TypeReference<List<Integer>>(){});

            // 3. 查询供应商详情
            return supplierMapper.getSuppliersByIds(supplierIds);
        }catch (Exception e) {
            log.error("Failed to recommend suppliers", e);
            return Collections.emptyList();
        }
    }

    public List<Activity> recommendActivity(Integer designerId) {
        try {
            // 0. 获取设计师信息 + 活动信息
            Designer designer = designerMapper.getDesignerById(designerId);

            // 1. 获取AI推荐响应
            String aiResponse = activitiesAI.recommendActivity("设计师信息:" + designer);

            // 2. 解析JSON响应
            ObjectMapper mapper = new ObjectMapper();
            List<Integer> activityList = mapper.readValue(aiResponse, new TypeReference<List<Integer>>(){});

            // 3. 查询活动详情
            return activityMapper.getActivitiesByIds(activityList);
        } catch (Exception e) {
            log.error("Failed to recommend activities", e);
            return Collections.emptyList();
        }
    }


}
