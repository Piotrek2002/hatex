package pl.hatex.hatex;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;

@SpringBootApplication(scanBasePackages = "pl.hatex.hatex")
@EnableJpaRepositories("pl.hatex.hatex.repository")
public class HatexApplication {

    public static void main(String[] args) {
        SpringApplication.run(HatexApplication.class, args);
    }

}
