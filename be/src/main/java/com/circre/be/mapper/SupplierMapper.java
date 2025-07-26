package com.circre.be.mapper;

import com.circre.be.entity.Supplier;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface SupplierMapper {
    Supplier getSupplierById(Integer id);
    //批量查询供应商
    List<Supplier> getSuppliersByIds(List<Integer> supplierIds);
}
