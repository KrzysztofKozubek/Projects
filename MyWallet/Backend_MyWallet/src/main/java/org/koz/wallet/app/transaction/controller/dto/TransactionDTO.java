package org.koz.wallet.app.transaction.controller.dto;

import java.math.BigDecimal;
import java.time.LocalDate;

public record TransactionDTO(
        Long id,
        String name,
        Long categoryId,
        Long bankId,
        Long walletId,
        BigDecimal amount,
        LocalDate timestamp) {
}
