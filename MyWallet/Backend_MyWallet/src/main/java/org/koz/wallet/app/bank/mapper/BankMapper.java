package org.koz.wallet.app.bank.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.koz.wallet.app.bank.model.Bank;
import org.koz.wallet.app.transaction.model.Transaction;
import org.koz.wallet.mybatis.annotation.ModelMapper;

import java.util.List;

@Mapper
public interface BankMapper extends ModelMapper {

    void addBank(@Param("bank") Bank bank);

    void editBankName(@Param("bank") Bank bank);

    void editBank(@Param("bank") Bank bank);

    void editBankAmount(@Param("bank") Bank bank);

    List<Bank> getUserBanks(@Param("userId") Long userId);
    List<Bank> getUserBanksInWallet(@Param("userId") Long userId, @Param("walletId") Long walletId);

    Bank getBank(@Param("userId") Long userId, @Param("bankId") Long bankId);

    void removeBank(@Param("userId") Long userId, @Param("bankId") Long bankId);

    void registerTransaction(@Param("transaction") Transaction transaction);
}
