package org.koz.wallet.app.wallet.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.koz.wallet.app.wallet.controller.dto.WalletDTO;
import org.koz.wallet.app.wallet.controller.dto.mapper.WalletDTOMapper;
import org.koz.wallet.app.wallet.model.Wallet;
import org.koz.wallet.app.wallet.service.WalletServiceImpl;
import org.koz.wallet.security.jwt.service.UserContextServiceImpl;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.CrossOrigin;

import javax.validation.Valid;
import java.util.List;

@Slf4j
@CrossOrigin
@RestController
@RequiredArgsConstructor
@RequestMapping("/wallet")
public class WalletController {

    private final WalletDTOMapper mapper;
    private final WalletServiceImpl walletService;
    private final UserContextServiceImpl userContextService;

    @GetMapping
    public List<WalletDTO> getWallets() {
        Long userId = userContextService.getUserId();
        List<Wallet> wallet = walletService.getWallets(userId);
        return mapper.to(wallet);
    }

    @GetMapping("/{walletId}")
    public WalletDTO getWallet(@PathVariable("walletId") Long walletId) {
        Long userId = userContextService.getUserId();
        Wallet wallet = walletService.getWallet(userId, walletId);
        return mapper.to(wallet);
    }

    @DeleteMapping("/{walletId}")
    public void removeWallet(@PathVariable("walletId") Long walletId) {
        Long userId = userContextService.getUserId();
        walletService.removeWallet(userId, walletId);
    }

    @PutMapping("/")
    public void addWallet(@Valid @RequestBody WalletDTO walletDTO) {
        Long userId = userContextService.getUserId();
        Wallet wallet = mapper.to(walletDTO);
        wallet.setUserId(userId);
        walletService.addWallet(wallet);
    }

    @PostMapping
    public void changeWallet(@Valid @RequestBody WalletDTO walletDTO) {
        Long userId = userContextService.getUserId();
        Wallet wallet = mapper.to(walletDTO);
        wallet.setUserId(userId);
        walletService.editWallet(wallet);
    }

    @PostMapping("/name")
    public void changeWalletName(@Valid @RequestBody WalletDTO walletDTO) {
        Long userId = userContextService.getUserId();
        Wallet wallet = mapper.to(walletDTO);
        wallet.setUserId(userId);
        walletService.editWalletName(wallet);
    }

    @PostMapping("/amount")
    public void changeWalletAmount(@Valid @RequestBody WalletDTO walletDTO) {
        Long userId = userContextService.getUserId();
        Wallet wallet = mapper.to(walletDTO);
        wallet.setUserId(userId);
        walletService.editWalletAmount(wallet);
    }
}
