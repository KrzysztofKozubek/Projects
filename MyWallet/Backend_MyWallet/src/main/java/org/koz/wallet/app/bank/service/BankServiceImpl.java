package org.koz.wallet.app.bank.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.koz.wallet.app.bank.mapper.BankMapper;
import org.koz.wallet.app.bank.model.Bank;
import org.koz.wallet.app.transaction.model.Transaction;
import org.koz.wallet.app.wallet.service.WalletServiceImpl;
import org.koz.wallet.security.jwt.model.UserContext;
import org.koz.wallet.security.jwt.service.UserContextServiceImpl;
import org.springframework.stereotype.Service;

import java.util.List;

@Slf4j
@Service
@RequiredArgsConstructor
public class BankServiceImpl {
    private final BankMapper bankMapper;
    private final WalletServiceImpl walletService;


    public Bank getBank(Long userId, Long bankId) {
        return bankMapper.getBank(userId, bankId);
    }

    public List<Bank> getBanks(Long userId) {
        return bankMapper.getUserBanks(userId);
    }

    public List<Bank> getBanksInWallet(Long userId, Long walletId) {
        return bankMapper.getUserBanksInWallet(userId, walletId);
    }

    public void removeBank(Long userId, Long id) {
        bankMapper.removeBank(userId, id);
    }

    public void addBank(Bank bank) {
        bankMapper.addBank(bank);
    }

    public void editNameBank(Bank bank) {
        bankMapper.editBankName(bank);
    }

    public void editBank(Bank bank) {
        Bank oldBank = bankMapper.getBank(bank.getUserId(), bank.getId());
        bankMapper.editBank(bank);
        if (!oldBank.getWalletId().equals(bank.getWalletId())) {
            walletService.registerTransaction(
                    Transaction.builder()
                            .userId(bank.getUserId())
                            .walletId(oldBank.getWalletId())
                            .amount(oldBank.getAmount().negate())
                            .build()
            );
            walletService.registerTransaction(
                    Transaction.builder()
                            .userId(bank.getUserId())
                            .walletId(bank.getWalletId())
                            .amount(bank.getAmount())
                            .build()
            );
        } else {
            walletService.registerTransaction(
                    Transaction.builder()
                            .userId(bank.getUserId())
                            .walletId(bank.getWalletId())
                            .amount(bank.getAmount().subtract(oldBank.getAmount()))
                            .build()
            );
        }
    }

    public void editAmountBank(Bank bank) {
        bankMapper.editBankAmount(bank);
    }

    public void registerTransaction(Transaction transaction) {
        bankMapper.registerTransaction(transaction);
        walletService.registerTransaction(transaction);
    }
}
