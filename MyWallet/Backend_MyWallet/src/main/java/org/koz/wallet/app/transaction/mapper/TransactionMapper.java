package org.koz.wallet.app.transaction.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.koz.wallet.app.transaction.model.Transaction;
import org.koz.wallet.mybatis.annotation.ModelMapper;

import java.math.BigDecimal;
import java.util.List;

@Mapper
public interface TransactionMapper extends ModelMapper {

    void addTransaction(@Param("transaction") Transaction transaction);
    void addTransactions(@Param("transactions") List<Transaction> transaction);

    void editTransaction(@Param("transaction") Transaction transaction);

    List<Transaction> getUserTransactions(@Param("userId") Long userId);

    Transaction getTransaction(@Param("userId") Long userId, @Param("transactionId") Long transactionId);

    void removeTransaction(@Param("userId") Long userId, @Param("transactionId") Long transactionId);
}
