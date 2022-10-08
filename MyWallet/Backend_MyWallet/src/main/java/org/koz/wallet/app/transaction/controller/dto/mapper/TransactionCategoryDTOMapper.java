package org.koz.wallet.app.transaction.controller.dto.mapper;

import org.koz.wallet.app.transaction.controller.dto.TransactionCategoryDTO;
import org.koz.wallet.app.transaction.controller.dto.TransactionDTO;
import org.koz.wallet.app.transaction.model.Transaction;
import org.koz.wallet.app.transaction.model.TransactionCategory;
import org.springframework.stereotype.Component;

import java.math.BigDecimal;
import java.util.List;
import java.util.stream.Collectors;

@Component
public class TransactionCategoryDTOMapper {

    public TransactionCategory to(TransactionCategoryDTO transactionDTO) {
        return TransactionCategory.builder()
                .id(transactionDTO.id())
                .name(transactionDTO.name())
                .keywords(transactionDTO.keywords())
                .build();
    }

    public List<TransactionCategoryDTO> to(List<TransactionCategory> transactions) {
        return transactions.stream()
                .map(this::to)
                .collect(Collectors.toList());
    }

    public TransactionCategoryDTO to(TransactionCategory transaction) {
        return new TransactionCategoryDTO(
                transaction.getId(),
                transaction.getName(),
                transaction.getKeywords()
        );
    }
}
