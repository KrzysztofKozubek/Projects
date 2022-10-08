package org.koz.wallet.app.transaction.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.koz.wallet.app.transaction.mapper.TransactionCategoryMapper;
import org.koz.wallet.app.transaction.model.TransactionCategory;
import org.springframework.stereotype.Service;

import java.util.List;

@Slf4j
@Service
@RequiredArgsConstructor
public class TransactionCategoryServiceImpl {

    private final TransactionCategoryMapper transactionMapper;

    public void addTransactionCategory(TransactionCategory transactionCategory) {
        transactionMapper.addTransactionCategory(transactionCategory);
    }

    public List<TransactionCategory> getTransactionsCategory(Long userId) {
        return transactionMapper.getUserTransactionsCategory(userId);
    }

    public void editNameTransactionCategory(TransactionCategory transactionCategory) {
        transactionMapper.editNameTransactionCategory(transactionCategory);
    }

    public void editTransactionCategory(TransactionCategory transactionCategory) {
        transactionMapper.editTransactionCategory(transactionCategory);
    }

    public void removeTransactionCategory(Long userId, Long id) {
        transactionMapper.removeTransactionCategory(userId, id);
    }
}
