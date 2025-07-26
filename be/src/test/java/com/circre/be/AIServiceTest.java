package com.circre.be;

import com.circre.be.common.utils.AIUtil;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.boot.test.context.SpringBootTest;

/**
 * {@code @BelongsProject:}be
 * {@code @BelongsPackage:}com.circre.be
 * {@code @Author:} Xukai
 * {@code @CreateTime:}2025-07-25  15:35
 * {@code @Description:}TODO
 * {@code @Version:}1.0
 */
@SpringBootTest
public class AIServiceTest {

    @Autowired
    @Qualifier("activitiesAI")
    private AIUtil aiUtil;
    @Test
    public void test() {
        String result = aiUtil.demo("你好");
        System.out.println(result);
    }
}
