package org.koz.wallet.app.wallet.controller.dto;

import java.math.BigDecimal;

public record WalletDTO(Long id, Long userId, String name, BigDecimal amount) {
}
