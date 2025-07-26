package com.circre.be.common.config;

import dev.langchain4j.community.model.dashscope.QwenChatModel;
import dev.langchain4j.model.chat.ChatModel;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class AIConfig {

    @Value("${langchain4j.community.dashscope.chat-model.api-key}")
    private String apiKey;

    @Value("${langchain4j.community.dashscope.chat-model.model-name}")
    private String modelName;

    @Value("${langchain4j.community.dashscope.chat-model.enable-search}")
    private boolean enableSearch;

    @Value("${langchain4j.community.dashscope.chat-model.temperature}")
    private float temperature;

    @Value("${langchain4j.community.dashscope.chat-model.max-tokens}")
    private int maxTokens;

    @Bean
    public ChatModel qwenChatModel() {
        if (apiKey == null || apiKey.isEmpty()) {
            throw new IllegalArgumentException("DashScope API key must be configured");
        }
        return QwenChatModel.builder()
                .apiKey(apiKey)
                .modelName(modelName)
                .enableSearch(enableSearch)
                .temperature(temperature)
                .maxTokens(maxTokens)
                .build();
    }
}