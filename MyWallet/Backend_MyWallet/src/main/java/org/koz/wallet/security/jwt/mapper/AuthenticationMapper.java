package org.koz.wallet.security.jwt.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.koz.wallet.security.jwt.model.Registration;
import org.koz.wallet.security.jwt.model.UserContext;
import org.koz.wallet.mybatis.annotation.ModelMapper;

@Mapper
public interface AuthenticationMapper extends ModelMapper {
    UserContext getUserContext(@Param("id") Long id);
    UserContext findOneByUserName(@Param("username") String username);
    boolean checkCanRegister(@Param("registration") Registration registration);
    void addUser(@Param("registration") Registration registration);
}
