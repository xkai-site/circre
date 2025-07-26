package com.circre.be.service.impl;

import com.circre.be.common.utils.FileUtils;
import com.circre.be.entity.Designer;
import com.circre.be.entity.DesignerPassword;
import com.circre.be.entity.DesignerVO;
import com.circre.be.mapper.DesignerMapper;
import com.circre.be.service.DesignerService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.BeansException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;

/**
 * {@code @BelongsProject:}be
 * {@code @BelongsPackage:}com.circre.be.service.impl
 * {@code @Author:} Xukai
 * {@code @CreateTime:}2025-07-26  09:23
 * {@code @Description:}TODO
 * {@code @Version:}1.0
 */
@Slf4j
@Service
@Transactional
public class DesignerServiceImpl implements DesignerService {
    @Autowired
    private DesignerMapper designerMapper;


    public Designer getDesignerById(Integer id) {
        return designerMapper.getDesignerById(id);
    }


    public void register(DesignerVO designerVO, MultipartFile avatarFile) {
        if (designerMapper.selectByEmail(designerVO.getContact()) > 0) {
            log.error("该用户已存在");
            throw new RuntimeException("该邮箱已被注册");
        }
        try {
            // 0. 判断是否需要上传头像
            if (avatarFile != null) {
                FileUtils fileUtils = new FileUtils();
                String avatar = fileUtils.upload(avatarFile);
                designerVO.setAvatar(avatar);
            }
            // 1. 转换VO为实体
            Designer designer = new Designer();
            BeanUtils.copyProperties(designerVO, designer);
            // 2. 调用Mapper插入
            designerMapper.insertMessage(designer);
            // 3. 获取刚刚插入后得到的id
            Integer id = designer.getId();
            DesignerPassword designerPassword = new DesignerPassword();
            designerPassword.setDesignerId(id);
            designerPassword.setPassword(designerVO.getPassword());
            designerMapper.insertPassword(designerPassword);
        } catch (IOException e) {
            throw new RuntimeException("注册失败:" + e.getMessage());
        }
    }
}
