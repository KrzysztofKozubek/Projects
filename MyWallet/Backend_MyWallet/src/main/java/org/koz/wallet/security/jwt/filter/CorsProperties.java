package org.koz.wallet.security.jwt.filter;

import lombok.Data;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Configuration;

import java.util.List;

@Data
@Configuration
@ConfigurationProperties(prefix = "general.mvc.cors")
public class CorsProperties {
    private List<String> allowedOrigin;
    private String allowedMethods;
    private String maxAge;
    private String allowedHeaders;
    private String exposedHeaders;
}