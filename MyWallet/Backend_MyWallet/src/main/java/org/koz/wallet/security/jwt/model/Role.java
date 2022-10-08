package org.koz.wallet.security.jwt.model;

import lombok.Getter;
import lombok.RequiredArgsConstructor;

@Getter
@RequiredArgsConstructor
public enum Role {
    PM("PM"),
    USER("USER"),
    ;

    private final String code;
}