package org.koz.wallet.security.jwt.service;

import liquibase.repackaged.org.apache.commons.lang3.StringUtils;
import lombok.RequiredArgsConstructor;
import org.koz.wallet.security.jwt.model.UserContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Component;

import java.util.Map;

@Component
@RequiredArgsConstructor
public class UserAuthenticationProvider implements AuthenticationProvider {

	private final UserDetailsServiceImpl userDetailsService;
	private final PasswordEncoder encoder;

	@Override
	public Authentication authenticate(Authentication authentication) throws AuthenticationException {
		String username = (String) authentication.getPrincipal();
		String password = (String) authentication.getCredentials();

		UserDetails userDetails = userDetailsService.loadUserByUsername(username);
		if (userDetails == null) {
			throw new UsernameNotFoundException(" The username does not exist ");
		}

		if (!StringUtils.equals(username, userDetails.getUsername()) || !encoder.matches(password, userDetails.getPassword())) {
			throw new BadCredentialsException(" Wrong user name or password ");
		}
		UserContext context = (UserContext) userDetails;
		Map<String, String> details = Map.of(
				"id", context.getId().toString()
		);
		UsernamePasswordAuthenticationToken token = new UsernamePasswordAuthenticationToken(userDetails, password, userDetails.getAuthorities());
		token.setDetails(details);
		return token;
	}

	@Override
	public boolean supports(Class<?> authentication) {
		return true;
	}

}