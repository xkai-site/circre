package com.circre.be.common.constant;

/**
 * {@code @BelongsProject:}be
 * {@code @BelongsPackage:}com.circre.be.common.constant
 * {@code @Author:} Xukai
 * {@code @CreateTime:}2025-07-25  15:32
 * {@code @Description:定义程序中一些参数配置，可根据营销策略等等动态调整}
 * {@code @Version:}1.0
 */
public class Parameters {
    public static final int maxMessages = 50;   // 用户与AI对话最大消息数量

    public static final String activityKnowledgePath = "src/main/resources/knowledge/ACTIVITY";
    public static final String materialKnowledgePath = "src/main/resources/knowledge/MATERIALS";
    public static final String supplierKnowledgePath = "src/main/resources/knowledge/MATERIAL_SUPPLIER";

    public static final boolean STORE_CHAT_HISTORY = true; // 是否存储对话历史
    public static final String CHAT_HISTORY_PATH = "data/chat_history"; // 存储路径
}
