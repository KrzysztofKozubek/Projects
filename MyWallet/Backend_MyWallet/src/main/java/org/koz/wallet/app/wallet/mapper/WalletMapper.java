package org.koz.wallet.app.wallet.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.koz.wallet.app.transaction.model.Transaction;
import org.koz.wallet.app.wallet.model.Wallet;
import org.koz.wallet.mybatis.annotation.ModelMapper;

import java.math.BigDecimal;
import java.util.List;

@Mapper
public interface WalletMapper extends ModelMapper {

    void addWallet(@Param("wallet") Wallet wallet);

    void editWallet(@Param("wallet") Wallet wallet);

    void editWalletName(@Param("wallet") Wallet wallet);

    void editWalletAmount(@Param("wallet") Wallet wallet);

    List<Wallet> getUserWallets(@Param("userId") Long userId);

    Wallet getWallet(@Param("userId") Long userId, @Param("walletId") Long walletId);

    void removeWallet(@Param("userId") Long userId, @Param("walletId") Long walletId);

    void registerTransaction(@Param("transaction") Transaction transaction);
}
