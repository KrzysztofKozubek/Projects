package org.koz.wallet.security.jwt.model;

import lombok.Data;
import lombok.EqualsAndHashCode;
import org.apache.ibatis.type.Alias;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import java.io.Serializable;
import java.util.Collection;
import java.util.HashSet;

@Data
@EqualsAndHashCode
@Alias("UserContext")
public class UserContext implements UserDetails, Serializable {

    private Long id;
    private String nickname;
    private String login;
    private String password;
    private boolean enabled;
    private Collection<GrantedAuthority> authorities = new HashSet<>(0);

    @Override
    public boolean isAccountNonExpired() {
        return true;
    }

    @Override
    public boolean isAccountNonLocked() {
        return true;
    }

    @Override
    public boolean isCredentialsNonExpired() {
        return true;
    }

    public void setEnabled(boolean enabled) {
        this.enabled = enabled;
    }

    @Override
    public boolean isEnabled() {
        return enabled;
    }

    @Override
    public String getUsername() {
        return login;
    }
}