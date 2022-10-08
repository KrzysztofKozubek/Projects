package org.koz.wallet.security.jwt.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.koz.wallet.app.wallet.controller.dto.WalletDTO;
import org.koz.wallet.app.wallet.model.Wallet;
import org.koz.wallet.security.jwt.controller.dto.RegistrationDTO;
import org.koz.wallet.security.jwt.controller.dto.mapper.RegistrationDTOMapper;
import org.koz.wallet.security.jwt.model.Registration;
import org.koz.wallet.security.jwt.service.RegistrationServiceImpl;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.validation.Valid;

@Slf4j
@RestController
@RequiredArgsConstructor
@RequestMapping("/registration")
public class RegistrationController {

    private final RegistrationDTOMapper mapper;
    private final RegistrationServiceImpl service;

    @PutMapping("/user")
    public void registration(@Valid @RequestBody RegistrationDTO registrationDTO) {
        Registration registration = mapper.to(registrationDTO);
        service.addNewUser(registration);
    }
}
