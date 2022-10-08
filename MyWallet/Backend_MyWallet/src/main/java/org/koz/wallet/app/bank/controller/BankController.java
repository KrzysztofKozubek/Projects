package org.koz.wallet.app.bank.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.koz.wallet.app.bank.controller.dto.BankDTO;
import org.koz.wallet.app.bank.controller.dto.mapper.BankDTOMapper;
import org.koz.wallet.app.bank.model.Bank;
import org.koz.wallet.app.bank.service.BankServiceImpl;
import org.koz.wallet.app.wallet.model.Wallet;
import org.koz.wallet.security.jwt.service.UserContextServiceImpl;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.validation.Valid;
import java.util.List;

@Slf4j
@RestController
@RequiredArgsConstructor
@RequestMapping("/bank")
public class BankController {

    private final BankDTOMapper mapper;
    private final BankServiceImpl bankService;
    private final UserContextServiceImpl userContextService;

    @GetMapping
    public List<BankDTO> getBanks() {
        Long userId = userContextService.getUserId();
        List<Bank> bank = bankService.getBanks(userId);
        return mapper.to(bank);
    }

    @GetMapping("/{bankId}")
    public BankDTO getBank(@PathVariable("bankId") Long bankId) {
        Long userId = userContextService.getUserId();
        Bank bank = bankService.getBank(userId, bankId);
        return mapper.to(bank);
    }

    @DeleteMapping("/{bankId}")
    public void removeWallet(@PathVariable("bankId") Long walletId) {
        Long userId = userContextService.getUserId();
        bankService.removeBank(userId, walletId);
    }

    @PutMapping
    public void addBank(@Valid @RequestBody BankDTO bankDTO) {
        Long userId = userContextService.getUserId();
        Bank bank = mapper.to(bankDTO);
        bank.setUserId(userId);
        bankService.addBank(bank);
    }

    @PostMapping
    public void changeNameBank(@Valid @RequestBody BankDTO bankDTO) {
        Long userId = userContextService.getUserId();
        Bank bank = mapper.to(bankDTO);
        bank.setUserId(userId);
        bankService.editBank(bank);
    }
}
