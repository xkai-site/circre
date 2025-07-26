package com.circre.be.mapper;

import com.circre.be.entity.Designer;
import com.circre.be.entity.DesignerPassword;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface DesignerMapper {
    // 根据id查询设计师
    Designer getDesignerById(Integer id);

    // 插入设计师(简易注册)
    void insertMessage(Designer designer);
    // 插入设计师密码
    void insertPassword(DesignerPassword designerPassword);
    // 用于检查邮箱是否已注册
    int selectByEmail(String email);
}
