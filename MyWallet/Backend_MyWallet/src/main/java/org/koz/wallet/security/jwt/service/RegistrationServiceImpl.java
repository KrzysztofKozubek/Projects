package org.koz.wallet.security.jwt.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.koz.wallet.security.jwt.mapper.AuthenticationMapper;
import org.koz.wallet.security.jwt.model.Registration;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

@Slf4j
@Service
@RequiredArgsConstructor
public class RegistrationServiceImpl {

    private final AuthenticationMapper mapper;
    private final PasswordEncoder encoder;

    public void addNewUser(Registration registration) {
        boolean canRegister = mapper.checkCanRegister(registration);
        if (canRegister) {
            registration.setPassword(encoder.encode(registration.getPassword()));
            mapper.addUser(registration);
        }
    }
}
