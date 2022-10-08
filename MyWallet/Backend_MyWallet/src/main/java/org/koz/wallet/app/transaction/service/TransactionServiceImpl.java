package org.koz.wallet.app.transaction.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.koz.wallet.app.bank.service.BankServiceImpl;
import org.koz.wallet.app.transaction.mapper.TransactionMapper;
import org.koz.wallet.app.transaction.model.Transaction;
import org.koz.wallet.security.jwt.model.UserContext;
import org.koz.wallet.security.jwt.service.UserContextServiceImpl;
import org.springframework.stereotype.Service;

import java.util.List;

@Slf4j
@Service
@RequiredArgsConstructor
public class TransactionServiceImpl {
    private final TransactionMapper transactionMapper;
    private final BankServiceImpl bankService;

    public void addTransaction(Transaction transaction) {
        transactionMapper.addTransaction(transaction);
        registerTransaction(transaction);
    }

    public void addTransactions(List<Transaction> transaction) {
        transactionMapper.addTransactions(transaction);
        transaction.forEach(this::registerTransaction);
    }

    public void registerTransaction(Transaction transaction) {
        bankService.registerTransaction(transaction);
    }

    public Transaction getTransaction(Long userId, Long id) {
        return transactionMapper.getTransaction(userId, id);
    }

    public List<Transaction> getTransactions(Long userId) {
        return transactionMapper.getUserTransactions(userId);
    }

    public void removeTransaction(Long userId, Long transactionId) {
        Transaction transaction = transactionMapper.getTransaction(userId, transactionId);
        transactionMapper.removeTransaction(userId, transactionId);
        transaction.setAmount(transaction.getAmount().negate());
        registerTransaction(transaction);
    }

    public void editTransaction(Transaction transaction) {
        Transaction oldTransaction = transactionMapper.getTransaction(transaction.getUserId(), transaction.getId());
        transactionMapper.editTransaction(transaction);

        // the same bank
        if (oldTransaction.getBankId().equals(transaction.getBankId())) {
            if (oldTransaction.getAmount().compareTo(transaction.getAmount()) != 0) {
                transaction.setAmount(transaction.getAmount().subtract(oldTransaction.getAmount()));
                registerTransaction(transaction);
            }
        } else {
            oldTransaction.setAmount(oldTransaction.getAmount().negate());
            registerTransaction(oldTransaction);
            registerTransaction(transaction);
        }
    }
}
