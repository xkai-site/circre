package com.circre.be.service;

import com.circre.be.entity.Activity;
import com.circre.be.entity.Material;
import com.circre.be.entity.Supplier;

import java.util.List;

public interface AIService {
    //根据设计师信息 + 问题 => 材料推荐(基于知识库)
    List<Material> recommendMaterial(Integer designerId,String sessionId, String question);
    //根据设计师信息 + 材料列表 => 供应商推荐(基于知识库)
    List<Supplier> recommendSupplier(Integer designerId,String sessionId, List<Integer> materialIds);
    //根据设计师信息 + 活动列表 => 活动推荐(基于知识库)
    List<Activity> recommendActivity(Integer designerId);
}
