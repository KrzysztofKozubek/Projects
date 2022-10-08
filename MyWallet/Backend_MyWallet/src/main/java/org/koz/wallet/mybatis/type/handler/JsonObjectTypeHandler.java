package org.koz.wallet.mybatis.type.handler;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.apache.ibatis.type.BaseTypeHandler;
import org.apache.ibatis.type.JdbcType;
import org.apache.ibatis.type.MappedTypes;
import org.koz.wallet.config.log.Loggable;

import java.io.IOException;
import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

@MappedTypes(JsonNode.class)
public class JsonObjectTypeHandler extends BaseTypeHandler<JsonNode> implements Loggable {

    @Override
    public void setNonNullParameter(PreparedStatement ps, int i, JsonNode parameter, JdbcType jdbcType) throws SQLException {
        ObjectMapper objectMapper = new ObjectMapper();
        try {
            String dbValue = objectMapper.writeValueAsString(parameter);
            ps.setString(i, dbValue);
        } catch (JsonProcessingException e) {
            throw new SQLException("Value cannot be stored due to exception during parsing json object", e);
        }
    }

    @Override
    public JsonNode getNullableResult(ResultSet rs, String columnName) throws SQLException {
        String dbString = rs.getString(columnName);
        if (rs.wasNull()) {
            return null;
        }
        return getResult(dbString);
    }

    @Override
    public JsonNode getNullableResult(ResultSet rs, int columnIndex) throws SQLException {
        String dbString = rs.getString(columnIndex);
        if (rs.wasNull()) {
            return null;
        }
        return getResult(dbString);
    }

    @Override
    public JsonNode getNullableResult(CallableStatement cs, int columnIndex) throws SQLException {
        String dbString = cs.getString(columnIndex);
        if (cs.wasNull()) {
            return null;
        }
        return getResult(dbString);
    }

    private JsonNode getResult(String dbString) {
        ObjectMapper objectMapper = new ObjectMapper();
        try {
            return objectMapper.readTree(dbString);
        } catch (IOException e) {
            logger().error("Cannot parse json value: " + dbString + " due to exception: ", e);
        }
        return null;
    }
}
