package org.koz.wallet.security.jwt.filter;

import liquibase.repackaged.org.apache.commons.lang3.ObjectUtils;
import org.springframework.core.Ordered;
import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Component;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@Component
@Order(Ordered.HIGHEST_PRECEDENCE)
public class SimpleCorsFilter implements Filter {

    public static final String DEFAULT_ALLOW_ALL_ORIGIN = "*";
    public static final String DEFAULT_ALLOW_ALL_METHOD = "POST, PUT, GET, OPTIONS, DELETE, PATCH, HEAD";
    public static final String DEFAULT_MAX_AGE = "3600";
    public static final String DEFAULT_ALLOWED_HEADERS = "Sec-WebSocket-Extensions, Sec-WebSocket-Key, Sec-WebSocket-Protocol, Sec-WebSocket-Version, Accept, x-requested-with, authorization, content-type, If-None-Match, notId";
    public static final String DEFAULT_EXPOSED_HEADERS = "Link, ETag";
    public static final String ORIGIN_HEADER = "Origin";
    public static final String NULL = "null";

    private CorsProperties corsProperties;

    public SimpleCorsFilter(CorsProperties corsProperties) {
        this.corsProperties = corsProperties;
    }

    @Override
    public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain) throws IOException, ServletException {
        HttpServletResponse response = (HttpServletResponse) res;
        HttpServletRequest request = (HttpServletRequest) req;

        String allowedOrigin = getAllowedOrigin(request);

        response.setHeader("Access-Control-Allow-Origin", allowedOrigin);
        response.setHeader("Access-Control-Allow-Methods", getAllowedMethods());
        response.setHeader("Access-Control-Max-Age", getMaxAge());
        response.setHeader("Access-Control-Allow-Headers", getAllowedHeaders());
        response.setHeader("Access-Control-Expose-Headers", getExposedHeaders());

        if ("OPTIONS".equalsIgnoreCase(request.getMethod())) {
            response.setStatus(HttpServletResponse.SC_OK);
        } else {
            chain.doFilter(req, res);
        }
    }

    private String getAllowedOrigin(HttpServletRequest request) {

        if (corsProperties.getAllowedOrigin() != null) {
            String origin = request.getHeader(ORIGIN_HEADER);
            return corsProperties.getAllowedOrigin().stream().filter(z -> z.equals(origin)).findFirst().orElse(NULL);
        } else {
            return DEFAULT_ALLOW_ALL_ORIGIN;
        }

    }


    protected String getAllowedMethods() {
        return ObjectUtils.defaultIfNull(corsProperties.getAllowedMethods(), DEFAULT_ALLOW_ALL_METHOD);
    }

    protected String getMaxAge() {
        return ObjectUtils.defaultIfNull(corsProperties.getMaxAge(), DEFAULT_MAX_AGE);
    }

    protected String getAllowedHeaders() {
        return ObjectUtils.defaultIfNull(corsProperties.getAllowedHeaders(), DEFAULT_ALLOWED_HEADERS);
    }

    protected String getExposedHeaders() {
        return ObjectUtils.defaultIfNull(corsProperties.getExposedHeaders(), DEFAULT_EXPOSED_HEADERS);
    }

    @Override
    public void init(FilterConfig filterConfig) {
    }

    @Override
    public void destroy() {
    }
}
