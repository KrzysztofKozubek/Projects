package org.koz.wallet;

import org.koz.wallet.app.ApplicationWalletComponent;
import org.koz.wallet.mybatis.MyBatisComponent;
import org.koz.wallet.mybatis.annotation.ModelMapper;
import org.koz.wallet.security.jwt.SecurityJWTComponent;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.context.annotation.Import;
import org.springframework.scheduling.annotation.EnableAsync;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;

@SpringBootApplication(scanBasePackages = "org.koz.wallet")
@MapperScan(value = {"org.koz.*.mapper", "org.koz.**.*.mapper"}, markerInterface = ModelMapper.class)
@EnableAsync
@EnableScheduling
@EnableAspectJAutoProxy
@EnableGlobalMethodSecurity(securedEnabled = true, prePostEnabled = true)
@Import({
        ApplicationWalletComponent.class,
        MyBatisComponent.class,
        SecurityJWTComponent.class
})
public class Application {

    public static void main(String[] args) {
        SpringApplication.run(Application.class, args);
    }

}
