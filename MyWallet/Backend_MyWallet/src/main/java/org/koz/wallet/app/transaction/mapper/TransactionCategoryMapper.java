package org.koz.wallet.app.transaction.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.koz.wallet.app.transaction.model.TransactionCategory;
import org.koz.wallet.mybatis.annotation.ModelMapper;

import java.util.List;

@Mapper
public interface TransactionCategoryMapper extends ModelMapper {

    void addTransactionCategory(@Param("transactionCategory") TransactionCategory transactionCategory);

    void editNameTransactionCategory(@Param("transactionCategory") TransactionCategory transactionCategory);

    void editTransactionCategory(@Param("transactionCategory") TransactionCategory transactionCategory);

    void removeTransactionCategory(@Param("userId") Long userId, @Param("transactionCategoryId") Long transactionCategoryId);

    List<TransactionCategory> getUserTransactionsCategory(@Param("userId") Long userId);
}
