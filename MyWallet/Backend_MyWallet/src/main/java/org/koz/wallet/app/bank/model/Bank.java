package org.koz.wallet.app.bank.model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class Bank {
    private Long id;
    private Long userId;
    private Long walletId;
    private String name;
    private BigDecimal amount;
}
