package org.koz.wallet.security.jwt.config;

import com.fasterxml.jackson.databind.ObjectMapper;
import org.koz.wallet.security.jwt.filter.JsonObjectAuthenticationFilter;
import org.koz.wallet.security.jwt.filter.JwtAuthorizationFilter;
import org.koz.wallet.security.jwt.handler.RestAuthenticationFailureHandler;
import org.koz.wallet.security.jwt.handler.RestAuthenticationSuccessHandler;
import org.koz.wallet.security.jwt.service.UserAuthenticationProvider;
import org.koz.wallet.security.jwt.service.UserDetailsServiceImpl;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.web.servlet.FilterRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpStatus;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.provisioning.JdbcUserDetailsManager;
import org.springframework.security.web.authentication.HttpStatusEntryPoint;
import org.springframework.web.cors.CorsConfiguration;
import org.springframework.web.cors.UrlBasedCorsConfigurationSource;
import org.springframework.web.filter.CorsFilter;

import javax.sql.DataSource;

@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {

    private final ObjectMapper objectMapper;
    private final RestAuthenticationSuccessHandler authSuccessHandler;
    private final RestAuthenticationFailureHandler authFailureHandler;
    private final UserAuthenticationProvider authenticationProvider;
    private final UserDetailsServiceImpl userDetailsService;
    private final String secret;

    private static final String[] OPEN_ENDPOINTS = new String[]{
            "/actuator/**",
            "/swagger-ui.html",
            "/v2/api-docs"
    };
    private static final String[] ANONYMOUS_ENDPOINTS = new String[]{
            "/registration/user"
    };

    public SecurityConfig(ObjectMapper objectMapper,
                          RestAuthenticationSuccessHandler authSuccessHandler,
                          RestAuthenticationFailureHandler authFailureHandler,
                          UserAuthenticationProvider authenticationProvider,
                          UserDetailsServiceImpl userDetailsService,
                          @Value("${jwt.secret}") String secret) {
        this.objectMapper = objectMapper;
        this.authSuccessHandler = authSuccessHandler;
        this.authFailureHandler = authFailureHandler;
        this.authenticationProvider = authenticationProvider;
        this.userDetailsService = userDetailsService;
        this.secret = secret;
    }

    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth.authenticationProvider(authenticationProvider);
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http.cors().disable();
        http.csrf().disable();

        http.authorizeRequests()
                .antMatchers(OPEN_ENDPOINTS).permitAll()
                .antMatchers(ANONYMOUS_ENDPOINTS).anonymous()
                .anyRequest().authenticated()

                .and()
                .sessionManagement().sessionCreationPolicy(SessionCreationPolicy.STATELESS)

                .and()
                .addFilter(authenticationFilter())
                .addFilter(new JwtAuthorizationFilter(authenticationManager(), userDetailsService, secret))
                .exceptionHandling()
                .authenticationEntryPoint(new HttpStatusEntryPoint(HttpStatus.UNAUTHORIZED));
    }

    public JsonObjectAuthenticationFilter authenticationFilter() throws Exception {
        JsonObjectAuthenticationFilter authFilter = new JsonObjectAuthenticationFilter(objectMapper);
        authFilter.setAuthenticationSuccessHandler(authSuccessHandler);
        authFilter.setAuthenticationFailureHandler(authFailureHandler);
        authFilter.setAuthenticationManager(super.authenticationManager());
        return authFilter;
    }
}