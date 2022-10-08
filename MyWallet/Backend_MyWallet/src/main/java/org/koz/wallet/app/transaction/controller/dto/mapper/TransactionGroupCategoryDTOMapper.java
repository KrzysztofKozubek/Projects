package org.koz.wallet.app.transaction.controller.dto.mapper;

import org.koz.wallet.app.transaction.controller.dto.TransactionGroupCategoryDTO;
import org.koz.wallet.app.transaction.model.TransactionGroupCategory;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.stream.Collectors;

@Component
public class TransactionGroupCategoryDTOMapper {

    public TransactionGroupCategory to(TransactionGroupCategoryDTO dto) {
        return TransactionGroupCategory.builder()
                .id(dto.id())
                .name(dto.name())
                .color(dto.color())
                .keywords(dto.keywords())
                .build();
    }

    public List<TransactionGroupCategoryDTO> to(List<TransactionGroupCategory> transactions) {
        return transactions.stream()
                .map(this::to)
                .collect(Collectors.toList());
    }

    public TransactionGroupCategoryDTO to(TransactionGroupCategory transaction) {
        return new TransactionGroupCategoryDTO(
                transaction.getId(),
                transaction.getName(),
                transaction.getColor(),
                transaction.getKeywords()
        );
    }
}
