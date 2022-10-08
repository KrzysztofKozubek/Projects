package org.koz.wallet.app.transaction.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.koz.wallet.app.transaction.controller.dto.TransactionCategoryDTO;
import org.koz.wallet.app.transaction.controller.dto.TransactionGroupCategoryDTO;
import org.koz.wallet.app.transaction.controller.dto.mapper.TransactionCategoryDTOMapper;
import org.koz.wallet.app.transaction.controller.dto.mapper.TransactionGroupCategoryDTOMapper;
import org.koz.wallet.app.transaction.model.Transaction;
import org.koz.wallet.app.transaction.model.TransactionCategory;
import org.koz.wallet.app.transaction.model.TransactionGroupCategory;
import org.koz.wallet.app.transaction.service.TransactionCategoryServiceImpl;
import org.koz.wallet.app.transaction.service.TransactionGroupCategoryServiceImpl;
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
@RequestMapping("/transaction/category/group")
public class TransactionGroupCategoryController {

    private final TransactionGroupCategoryDTOMapper mapper;
    private final TransactionGroupCategoryServiceImpl transactionGroupCategoryService;
    private final UserContextServiceImpl userContextService;

    @GetMapping
    public List<TransactionGroupCategoryDTO> getTransactions() {
        Long userId = userContextService.getUserId();
        List<TransactionGroupCategory> transactionCategories = transactionGroupCategoryService.getAll(userId);
        return mapper.to(transactionCategories);
    }

    @DeleteMapping("/{transactionGroupCategoryId}")
    public void removeTransaction(@Valid @PathVariable("transactionGroupCategoryId") Long transactionGroupCategoryId) {
        Long userId = userContextService.getUserId();
        transactionGroupCategoryService.remove(userId, transactionGroupCategoryId);
    }

    @PutMapping
    public void addTransaction(@Valid @RequestBody TransactionGroupCategoryDTO transactionGroupCategoryDTO) {
        Long userId = userContextService.getUserId();
        TransactionGroupCategory transactionGroupCategory = mapper.to(transactionGroupCategoryDTO);
        transactionGroupCategory.setUserId(userId);
        transactionGroupCategoryService.add(transactionGroupCategory);
    }

    @PostMapping
    public void changeTransaction(@Valid @RequestBody TransactionGroupCategoryDTO transactionGroupCategoryDTO) {
        Long userId = userContextService.getUserId();
        TransactionGroupCategory transactionGroupCategory = mapper.to(transactionGroupCategoryDTO);
        transactionGroupCategory.setUserId(userId);
        transactionGroupCategoryService.edit(transactionGroupCategory);
    }
}
