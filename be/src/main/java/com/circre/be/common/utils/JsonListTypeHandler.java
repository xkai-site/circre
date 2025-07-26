package com.circre.be.common.utils;

/**
 * {@code @BelongsProject:}be
 * {@code @BelongsPackage:}com.circre.be.common.utils
 * {@code @Author:} Xukai
 * {@code @CreateTime:}2025-07-27  03:35
 * {@code @Description:}TODO
 * {@code @Version:}1.0
 */
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.apache.ibatis.type.BaseTypeHandler;
import org.apache.ibatis.type.JdbcType;
import org.apache.ibatis.type.MappedJdbcTypes;
import org.apache.ibatis.type.MappedTypes;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

@MappedJdbcTypes(JdbcType.VARCHAR)
@MappedTypes(List.class)
public class JsonListTypeHandler extends BaseTypeHandler<List<Integer>> {

    private static final ObjectMapper objectMapper = new ObjectMapper();

    @Override
    public void setNonNullParameter(PreparedStatement ps, int i, List<Integer> parameter, JdbcType jdbcType) throws SQLException {
        try {
            String json = objectMapper.writeValueAsString(parameter);
            ps.setString(i, json);
        } catch (JsonProcessingException e) {
            throw new SQLException("Error converting List to JSON", e);
        }
    }

    @Override
    public List<Integer> getNullableResult(ResultSet rs, String columnName) throws SQLException {
        String json = rs.getString(columnName);
        return parseJson(json);
    }

    @Override
    public List<Integer> getNullableResult(ResultSet rs, int columnIndex) throws SQLException {
        String json = rs.getString(columnIndex);
        return parseJson(json);
    }

    @Override
    public List<Integer> getNullableResult(CallableStatement cs, int columnIndex) throws SQLException {
        String json = cs.getString(columnIndex);
        return parseJson(json);
    }

    private List<Integer> parseJson(String json) throws SQLException {
        if (json == null || json.isEmpty()) {
            return null;
        }
        try {
            return objectMapper.readValue(json, new TypeReference<List<Integer>>() {});
        } catch (JsonProcessingException e) {
            throw new SQLException("Error parsing JSON", e);
        }
    }
}
