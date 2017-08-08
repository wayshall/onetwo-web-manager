package org.onetwo.webapp.manager;

import org.onetwo.boot.core.EnableJFishBootExtension;
import org.onetwo.boot.core.EnableJFishBootExtension.AppcationType;
import org.onetwo.dbm.spring.EnableDbm;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.groovy.template.GroovyTemplateAutoConfiguration;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@SpringBootApplication(exclude={GroovyTemplateAutoConfiguration.class})
//@SpringBootApplication(exclude={VelocityAutoConfiguration.class})
@EnableJFishBootExtension(appcationType=AppcationType.WEB_UI)
@EnableDbm
public class WebManagerStarter {
	
	@RequestMapping("/")
    String home() {
        return "index";
    }
	
    public static void main(String[] args) {
        SpringApplication.run(WebManagerStarter.class, args);
    }
}
