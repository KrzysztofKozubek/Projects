package org.koz.wallet.app.bank.controller.dto.mapper;

import org.koz.wallet.app.bank.controller.dto.BankDTO;
import org.koz.wallet.app.bank.model.Bank;
import org.koz.wallet.app.wallet.model.Wallet;
import org.springframework.stereotype.Component;

import java.math.BigDecimal;
import java.util.List;
import java.util.stream.Collectors;

@Component
public class BankDTOMapper {

    public Bank to(BankDTO bankDTO) {
        return Bank.builder()
                .id(bankDTO.id())
                .userId(bankDTO.userId())
                .walletId(bankDTO.walletId())
                .name(bankDTO.name())
                .amount(BigDecimal.ZERO)
                .build();
    }

    public List<BankDTO> to(List<Bank> banks) {
        return banks.stream()
                .map(this::to)
                .collect(Collectors.toList());
    }

    public BankDTO to(Bank bank) {
        return new BankDTO(
                bank.getId(),
                bank.getUserId(),
                bank.getWalletId(),
                bank.getName(),
                bank.getAmount()
        );
    }
}
