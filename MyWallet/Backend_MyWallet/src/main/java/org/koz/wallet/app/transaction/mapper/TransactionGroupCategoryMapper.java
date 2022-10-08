package org.koz.wallet.app.transaction.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.koz.wallet.app.transaction.model.TransactionCategory;
import org.koz.wallet.app.transaction.model.TransactionGroupCategory;
import org.koz.wallet.mybatis.annotation.ModelMapper;

import java.util.List;

@Mapper
public interface TransactionGroupCategoryMapper extends ModelMapper {

    void add(@Param("item") TransactionGroupCategory item);

    void edit(@Param("item") TransactionGroupCategory item);

    void remove(@Param("userId") Long userId, @Param("itemId") Long itemId);

    List<TransactionGroupCategory> getAllUser(@Param("userId") Long userId);
}
