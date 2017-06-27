package org.onetwo.webapp.manager;

import org.onetwo.boot.core.EnableJFishBootExtension;
import org.onetwo.boot.core.EnableJFishBootExtension.AppcationType;
import org.onetwo.dbm.spring.EnableDbm;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.groovy.template.GroovyTemplateAutoConfiguration;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.support.SpringBootServletInitializer;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@SpringBootApplication(exclude={GroovyTemplateAutoConfiguration.class})
//@SpringBootApplication(exclude={VelocityAutoConfiguration.class})
@EnableJFishBootExtension(appcationType=AppcationType.WEB_UI)
@EnableDbm
public class WebManagerStarter extends SpringBootServletInitializer {
	
	@RequestMapping("/")
    String home() {
        return "index";
    }
	
	@Override
	protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
		return application.sources(WebManagerStarter.class);
	}
	
    public static void main(String[] args) {
        SpringApplication.run(WebManagerStarter.class, args);
    }
}
