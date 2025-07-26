package com.circre.be.common.utils;

import dev.langchain4j.service.SystemMessage;

public interface AIUtil {

    //从prompts/demo1.txt中读取系统提示
    @SystemMessage(fromResource = "prompts/demo1.txt")
    String demo(String userMessage);

    @SystemMessage(fromResource = "prompts/MaterialPrompt.txt")
    String recommendMaterial(String userMessage);

    @SystemMessage(fromResource = "prompts/SupplierPrompt.txt")
    String recommendSupplier(String userMessage);

    @SystemMessage(fromResource = "prompts/ActivityPrompt.txt")
    String recommendActivity(String userMessage);
}