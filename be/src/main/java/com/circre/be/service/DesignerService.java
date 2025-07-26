package com.circre.be.service;

import com.circre.be.entity.Designer;
import com.circre.be.entity.DesignerVO;
import org.springframework.web.multipart.MultipartFile;

public interface DesignerService {
    //根据id查询设计师
    Designer getDesignerById(Integer id);
    //新增设计师(简单的新增逻辑)
    void register(DesignerVO designerVO, MultipartFile avatarFile);
}
