package org.koz.wallet.app.transaction.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.koz.wallet.app.transaction.mapper.TransactionCategoryMapper;
import org.koz.wallet.app.transaction.mapper.TransactionGroupCategoryMapper;
import org.koz.wallet.app.transaction.model.TransactionCategory;
import org.koz.wallet.app.transaction.model.TransactionGroupCategory;
import org.springframework.stereotype.Service;

import java.util.List;

@Slf4j
@Service
@RequiredArgsConstructor
public class TransactionGroupCategoryServiceImpl {

    private final TransactionGroupCategoryMapper transactionMapper;

    public void add(TransactionGroupCategory transactionCategory) {
        transactionMapper.add(transactionCategory);
    }

    public List<TransactionGroupCategory> getAll(Long userId) {
        return transactionMapper.getAllUser(userId);
    }

    public void edit(TransactionGroupCategory transactionCategory) {
        transactionMapper.edit(transactionCategory);
    }

    public void remove(Long userId, Long id) {
        transactionMapper.remove(userId, id);
    }
}
