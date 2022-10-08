package org.koz.wallet.config.security;

import lombok.RequiredArgsConstructor;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class BCryptProvider implements PasswordEncoder {

    private static final int BCRYPT_STRENGTH = 13;
    private static final BCryptPasswordEncoder ENCODER = new BCryptPasswordEncoder(BCRYPT_STRENGTH);

    @Override
    public String encode(CharSequence providedPassword) {
        return ENCODER.encode(providedPassword);
    }

    @Override
    public boolean matches(CharSequence providedPassword, String encodedPassword) {
        return ENCODER.matches(providedPassword, encodedPassword);
    }
}