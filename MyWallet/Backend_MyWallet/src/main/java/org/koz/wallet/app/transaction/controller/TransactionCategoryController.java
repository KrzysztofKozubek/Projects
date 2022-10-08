package org.koz.wallet.app.transaction.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.koz.wallet.app.transaction.controller.dto.TransactionCategoryDTO;
import org.koz.wallet.app.transaction.controller.dto.mapper.TransactionCategoryDTOMapper;
import org.koz.wallet.app.transaction.model.Transaction;
import org.koz.wallet.app.transaction.model.TransactionCategory;
import org.koz.wallet.app.transaction.service.TransactionCategoryServiceImpl;
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
@RequestMapping("/transaction/category")
public class TransactionCategoryController {

    private final TransactionCategoryDTOMapper mapper;
    private final TransactionCategoryServiceImpl transactionCategoryService;
    private final UserContextServiceImpl userContextService;

    @GetMapping
    public List<TransactionCategoryDTO> getTransactions() {
        Long userId = userContextService.getUserId();
        List<TransactionCategory> transactionCategories = transactionCategoryService.getTransactionsCategory(userId);
        return mapper.to(transactionCategories);
    }

    @DeleteMapping("/{transactionCategoryId}")
    public void removeTransaction(@Valid @PathVariable("transactionCategoryId") Long transactionCategoryId) {
        Long userId = userContextService.getUserId();
        transactionCategoryService.removeTransactionCategory(userId, transactionCategoryId);
    }

    @PutMapping
    public void addTransaction(@Valid @RequestBody TransactionCategoryDTO transactionCategoryDTO) {
        Long userId = userContextService.getUserId();
        TransactionCategory transactionCategory = mapper.to(transactionCategoryDTO);
        transactionCategory.setUserId(userId);
        transactionCategoryService.addTransactionCategory(transactionCategory);
    }
String a = ["4F","Action","C&A","CALZEDONIA","CARRY","CCC","Conti","crop","DECATHLON","Funk N Soul","H AND M","MARTES SPORT","OTCF","Peek & Cloppenburg","PEPCO","PLOCICA","RESERVED"]
    @PostMapping
    public void changeTransaction(@Valid @RequestBody TransactionCategoryDTO transactionCategoryDTO) {
        Long userId = userContextService.getUserId();
        TransactionCategory transactionCategory = mapper.to(transactionCategoryDTO);
        transactionCategory.setUserId(userId);
        transactionCategoryService.editTransactionCategory(transactionCategory);
    }

    @PostMapping("/name")
    public void changeNameTransaction(@Valid @RequestBody TransactionCategoryDTO transactionCategoryDTO) {
        Long userId = userContextService.getUserId();
        TransactionCategory transactionCategory = mapper.to(transactionCategoryDTO);
        transactionCategory.setUserId(userId);
        transactionCategoryService.editNameTransactionCategory(transactionCategory);
    }
}
