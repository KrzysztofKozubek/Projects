package org.koz.wallet.security.jwt.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.koz.wallet.security.jwt.controller.dto.RegistrationDTO;
import org.koz.wallet.security.jwt.controller.dto.mapper.RegistrationDTOMapper;
import org.koz.wallet.security.jwt.model.Registration;
import org.koz.wallet.security.jwt.model.UserContext;
import org.koz.wallet.security.jwt.service.RegistrationServiceImpl;
import org.koz.wallet.security.jwt.service.UserContextServiceImpl;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.validation.Valid;

@Slf4j
@RestController
@RequiredArgsConstructor
@RequestMapping("/user")
public class UserController {

    private final UserContextServiceImpl userContextService;

    @GetMapping
    public UserContext getMe() {
        return userContextService.getUserContext();
    }
}
