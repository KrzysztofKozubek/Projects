package org.koz.wallet.app.transaction.controller.dto.mapper;

import org.koz.wallet.app.transaction.controller.dto.TransactionDTO;
import org.koz.wallet.app.transaction.model.Transaction;
import org.springframework.stereotype.Component;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.util.List;
import java.util.stream.Collectors;

@Component
public class TransactionDTOMapper {

    public List<Transaction> mapList(List<TransactionDTO> transactions) {
        return transactions.stream()
                .map(this::to)
                .collect(Collectors.toList());
    }

    public Transaction to(TransactionDTO transactionDTO) {
        return Transaction.builder()
                .id(transactionDTO.id())
                .name(transactionDTO.name())
                .categoryId(transactionDTO.categoryId())
                .bankId(transactionDTO.bankId())
                .walletId(transactionDTO.walletId())
                .amount(transactionDTO.amount() == null ? BigDecimal.ZERO : transactionDTO.amount())
                .timestamp(LocalDateTime.of(transactionDTO.timestamp(), LocalTime.of(0, 0)))
                .build();
    }

    public List<TransactionDTO> to(List<Transaction> transactions) {
        return transactions.stream()
                .map(this::to)
                .collect(Collectors.toList());
    }

    public TransactionDTO to(Transaction transaction) {
        return transaction == null
                ? null
                : new TransactionDTO(
                transaction.getId(),
                transaction.getName(),
                transaction.getCategoryId(),
                transaction.getBankId(),
                transaction.getWalletId(),
                transaction.getAmount(),
                transaction.getTimestamp().toLocalDate()
        );
    }
}
