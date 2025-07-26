package com.circre.be.common.utils;

import com.circre.be.common.constant.Parameters;
import dev.langchain4j.memory.ChatMemory;
import dev.langchain4j.memory.chat.MessageWindowChatMemory;
import dev.langchain4j.model.chat.ChatModel;
import dev.langchain4j.rag.content.retriever.ContentRetriever;
import dev.langchain4j.service.AiServices;
import jakarta.annotation.Resource;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * {@code @BelongsProject:}be
 * {@code @BelongsPackage:}com.circre.be.common.utils
 * {@code @Author:} Xukai
 * {@code @CreateTime:}2025-07-25  14:57
 * {@code @Description:提供AI服务工厂}
 * {@code @Version:}1.0
 */
@Configuration
public class AIServiceFactory {

    @Resource
    private ChatModel qwenChatModel;

    @Bean
    public AIUtil materialsAI(@Qualifier("materialsRetriever") ContentRetriever retriever) {
        return buildAIUtil(retriever);
    }

    @Bean
    public AIUtil suppliersAI(@Qualifier("suppliersRetriever") ContentRetriever retriever) {
        return buildAIUtil(retriever);
    }

    @Bean
    public AIUtil activitiesAI(@Qualifier("activitiesRetriever") ContentRetriever retriever) {
        return buildAIUtil(retriever);
    }
    /**
     * {@code @description:}
     * {@code @author:} Xukai
     * {@code @date:} 2025/7/26 01:22
     * {@code @return:}com.circre.be.common.utils.AIUtil
     * 引用知识库，支持多轮对话
     **/
    private AIUtil buildAIUtil(ContentRetriever retriever) {
        ChatMemory chatMemory = MessageWindowChatMemory.withMaxMessages(Parameters.maxMessages);
        return AiServices.builder(AIUtil.class)
                .chatModel(qwenChatModel)
                .contentRetriever(retriever)    //引用知识库
                .chatMemory(chatMemory)
                .build();
    }
    /**
     * {@code @description:}
     * {@code @author:} Xukai
     * {@code @date:} 2025/7/26 01:21
     * {@code @return:}com.circre.be.common.utils.AIUtil
     * 单纯引用AI，不引用知识库，支持多轮对话
     **/
    public AIUtil buildAIUtil() {
        ChatMemory chatMemory = MessageWindowChatMemory.withMaxMessages(Parameters.maxMessages);
        return AiServices.builder(AIUtil.class)
                .chatModel(qwenChatModel)
                .chatMemory(chatMemory)
                .build();
    }

}
