package pl.hatex.hatex.app;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.transaction.annotation.EnableTransactionManagement;

@SpringBootApplication(scanBasePackages = "pl.hatex.hatex")

public class HatexApplication {

    public static void main(String[] args) {
        SpringApplication.run(HatexApplication.class, args);
    }

}
