package org.koz.wallet.app.transaction.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.koz.wallet.app.transaction.controller.dto.TransactionDTO;
import org.koz.wallet.app.transaction.controller.dto.mapper.TransactionDTOMapper;
import org.koz.wallet.app.transaction.model.Transaction;
import org.koz.wallet.app.transaction.service.TransactionServiceImpl;
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
@RequestMapping("/transaction")
public class TransactionController {

    private final TransactionDTOMapper mapper;
    private final TransactionServiceImpl transactionService;
    private final UserContextServiceImpl userContextService;

    @GetMapping
    public List<TransactionDTO> getTransactions() {
        Long userId = userContextService.getUserId();
        List<Transaction> transaction = transactionService.getTransactions(userId);
        return mapper.to(transaction);
    }

    @GetMapping("/{transactionId}")
    public TransactionDTO getTransaction(@Valid @PathVariable("transactionId") Long transactionId) {
        Long userId = userContextService.getUserId();
        Transaction transaction = transactionService.getTransaction(userId, transactionId);
        return mapper.to(transaction);
    }

    @DeleteMapping("/{transactionId}")
    public void removeTransaction(@Valid @PathVariable("transactionId") Long transactionId) {
        Long userId = userContextService.getUserId();
        transactionService.removeTransaction(userId, transactionId);
    }

    @PutMapping
    public void addTransaction(@Valid @RequestBody TransactionDTO transactionDTO) {
        Long userId = userContextService.getUserId();
        Transaction transaction = mapper.to(transactionDTO);
        transaction.setUserId(userId);
        transactionService.addTransaction(transaction);
    }

    @PutMapping("/batch")
    public void addTransaction(@Valid @RequestBody List<TransactionDTO> transactionDTO) {
        Long userId = userContextService.getUserId();
        List<Transaction> transaction = mapper.mapList(transactionDTO);
        transaction.forEach(t -> t.setUserId(userId));
        transactionService.addTransactions(transaction);
    }

    @PostMapping
    public void editTransaction(@Valid @RequestBody TransactionDTO transactionDTO) {
        Long userId = userContextService.getUserId();
        Transaction transaction = mapper.to(transactionDTO);
        transaction.setUserId(userId);
        transactionService.editTransaction(transaction);
    }
}
