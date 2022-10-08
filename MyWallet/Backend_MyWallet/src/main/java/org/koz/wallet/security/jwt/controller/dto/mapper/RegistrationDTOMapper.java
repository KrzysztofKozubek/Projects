package org.koz.wallet.security.jwt.controller.dto.mapper;

import lombok.RequiredArgsConstructor;
import org.koz.wallet.security.jwt.controller.dto.RegistrationDTO;
import org.koz.wallet.security.jwt.model.Registration;
import org.springframework.stereotype.Component;

@Component
@RequiredArgsConstructor
public class RegistrationDTOMapper {

    public Registration to(RegistrationDTO registrationDTO) {
        return Registration.builder()
                .login(registrationDTO.getLogin())
                .name(registrationDTO.getName())
                .password(registrationDTO.getPassword())
                .build();
    }
}
