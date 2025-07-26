package com.circre.be.common.utils;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

/**
 * {@code @BelongsProject:}be
 * {@code @BelongsPackage:}com.circre.be.common.utils
 * {@code @Author:} Xukai
 * {@code @CreateTime:}2025-07-26  16:51
 * {@code @Description:}TODO
 * {@code @Version:}1.0
 */
@Slf4j
@Component
public class FileUtils {
    @Value("${file.upload.address}")
    private String fileAddress;     //默认的文件起始存放路径，可在配置文件(application.yml)中修改

    public String upload(MultipartFile file) throws IOException {
        log.info("上传文件:{}", file.getOriginalFilename());

        //检验文件存放路径是否存在
        Path dir = Paths.get(fileAddress).toAbsolutePath().normalize();
        if (!Files.exists(dir)) {
            Files.createDirectories(dir);
        }

        //构建文件地址
        String fileName = System.currentTimeMillis() + "_" + file.getOriginalFilename();
        Path filePath = dir.resolve(fileName.replace("\\", "/"));  //构建文件路径(默认 + 文件名)
        if (Files.exists(filePath)) {            //若File存在
            throw new IllegalArgumentException("再试一次吧");
        } else {
            file.transferTo(filePath);          //若不存在，将文件写入指定路径
        }

        return filePath.toString(); //返回值其实就是图片路径
    }
}