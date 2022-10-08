package org.koz.wallet.app.wallet.controller.dto.mapper;

import lombok.RequiredArgsConstructor;
import org.koz.wallet.app.wallet.controller.dto.WalletDTO;
import org.koz.wallet.app.wallet.model.Wallet;
import org.koz.wallet.security.jwt.service.UserContextServiceImpl;
import org.springframework.stereotype.Component;

import java.math.BigDecimal;
import java.util.List;
import java.util.Objects;
import java.util.stream.Collectors;

@Component
@RequiredArgsConstructor
public class WalletDTOMapper {

    public Wallet to(WalletDTO walletDTO) {
        return Wallet.builder()
                .id(walletDTO.id())
                .userId(walletDTO.userId())
                .name(walletDTO.name())
                .amount(Objects.isNull(walletDTO.amount()) ? BigDecimal.ZERO : walletDTO.amount())
                .build();
    }

    public List<WalletDTO> to(List<Wallet> wallets) {
        return wallets.stream()
                .map(this::to)
                .collect(Collectors.toList());
    }

    public WalletDTO to(Wallet wallet) {
        return Objects.isNull(wallet)
                ? null
                : new WalletDTO(
                wallet.getId(),
                wallet.getUserId(),
                wallet.getName(),
                wallet.getAmount()
        );
    }
}
