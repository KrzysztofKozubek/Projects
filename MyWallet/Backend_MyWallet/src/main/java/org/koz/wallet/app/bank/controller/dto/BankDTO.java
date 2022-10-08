package org.koz.wallet.app.bank.controller.dto;

import java.math.BigDecimal;

public record BankDTO(Long id, Long userId, Long walletId, String name, BigDecimal amount) {
}
