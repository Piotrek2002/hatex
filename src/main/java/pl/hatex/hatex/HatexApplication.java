package pl.hatex.hatex;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.validation.Validator;
import org.springframework.validation.beanvalidation.LocalValidatorFactoryBean;
import org.springframework.web.servlet.LocaleContextResolver;
import org.springframework.web.servlet.i18n.SessionLocaleResolver;

import java.util.Locale;

@SpringBootApplication(scanBasePackages = "pl.hatex.hatex")
@EnableJpaRepositories("pl.hatex.hatex.repository")
public class HatexApplication {

    public static void main(String[] args) {
        SpringApplication.run(HatexApplication.class, args);
    }


}
