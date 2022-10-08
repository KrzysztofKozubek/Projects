package org.koz.wallet.security.jwt.model;

import lombok.Data;
import org.springframework.security.core.GrantedAuthority;

@Data
public class CustomPermission implements GrantedAuthority {

    private PermissionTypes authority;

    @Override
    public String getAuthority() {
        return authority.getDictionaryCode();
    }
}