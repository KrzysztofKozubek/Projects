package org.koz.wallet.security.jwt.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.koz.wallet.security.jwt.model.UserContext;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Slf4j
@Service
@RequiredArgsConstructor
public class UserContextServiceImpl {

    public UserContext getUserContext() {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        Object principal = authentication != null ? authentication.getPrincipal() : null;
        if (principal instanceof UserContext userContext) {
            return userContext;
        }
        return null;
    }

    public Long getUserId() {
        return Optional.ofNullable(getUserContext())
                .map(UserContext::getId)
                .orElse(null);
    }
}
