package employee.config;

import javax.persistence.EntityManager;
import javax.persistence.Persistence;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;

@Configuration
@ComponentScan(basePackages = {"employee"})
public class Config {

	@Bean
	public EntityManager getEntityManger() {
		return  Persistence.createEntityManagerFactory("demo").createEntityManager();
	}
}
