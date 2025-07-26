package com.circre.be.mapper;

import com.circre.be.entity.UserSelections;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface UserSelectionsMapper {
    //查询数据库中是否有sessionId
    boolean getSelectionsBySessionId(String sessionId);
    //若数据库中没有该sessionId，就插入新数据
    void insertSelections(UserSelections userSelections);
    //若数据可已经有sessionId对应数据，就更新数据
    void updateSelections(UserSelections userSelections);
}
