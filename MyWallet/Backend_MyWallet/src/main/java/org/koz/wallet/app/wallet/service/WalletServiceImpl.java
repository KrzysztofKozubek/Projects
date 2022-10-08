package org.koz.wallet.app.wallet.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.koz.wallet.app.transaction.model.Transaction;
import org.koz.wallet.app.wallet.mapper.WalletMapper;
import org.koz.wallet.app.wallet.model.Wallet;
import org.koz.wallet.security.jwt.model.UserContext;
import org.koz.wallet.security.jwt.service.UserContextServiceImpl;
import org.springframework.stereotype.Service;

import java.util.List;

@Slf4j
@Service
@RequiredArgsConstructor
public class WalletServiceImpl {
    private final WalletMapper walletMapper;

    public Wallet getWallet(Long userId, Long walletId) {
        return walletMapper.getWallet(userId, walletId);
    }

    public List<Wallet> getWallets(Long userId) {
        return walletMapper.getUserWallets(userId);
    }

    public void removeWallet(Long userId, Long id) {
        walletMapper.removeWallet(userId, id);
    }

    public void addWallet(Wallet wallet) {
        walletMapper.addWallet(wallet);
    }

    public void editWallet(Wallet wallet) {
        walletMapper.editWallet(wallet);
    }

    public void editWalletName(Wallet wallet) {
        walletMapper.editWalletName(wallet);
    }

    public void editWalletAmount(Wallet wallet) {
        walletMapper.editWalletAmount(wallet);
    }

    public void registerTransaction(Transaction transaction) {
        walletMapper.registerTransaction(transaction);
    }
}
