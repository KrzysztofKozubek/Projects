package org.koz.wallet.app.transaction.model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;
import java.time.LocalDateTime;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class Transaction {
    private Long id;
    private Long userId;
    private String name;
    private Long categoryId;
    private Long walletId;
    private Long bankId;
    private BigDecimal amount;
    private LocalDateTime timestamp;
}