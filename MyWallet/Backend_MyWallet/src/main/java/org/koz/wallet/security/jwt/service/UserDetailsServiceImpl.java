package org.koz.wallet.security.jwt.service;

import lombok.RequiredArgsConstructor;
import org.koz.wallet.security.jwt.mapper.AuthenticationMapper;
import org.springframework.context.annotation.Primary;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Component;

import java.util.Optional;

@Primary
@Component
@RequiredArgsConstructor
public class UserDetailsServiceImpl implements UserDetailsService {

    private final AuthenticationMapper authenticationMapper;

    @Override
    public UserDetails loadUserByUsername(String username) {
        return Optional.ofNullable(authenticationMapper.findOneByUserName(username))
                .orElseThrow(() -> new UsernameNotFoundException(String.format("User %s does not exist", username)));
    }
}