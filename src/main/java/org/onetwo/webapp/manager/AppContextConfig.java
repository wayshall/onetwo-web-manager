package org.onetwo.webapp.manager;

import java.util.Arrays;

import org.onetwo.boot.module.security.oauth2.EnableUserInfoResource;
import org.onetwo.boot.module.security.url.EnableUrlSecurity;
import org.onetwo.plugins.admin.AdminMgr;
import org.onetwo.plugins.admin.utils.WebAdminPermissionConfig.RootMenuClassListProvider;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.oauth2.config.annotation.web.configuration.EnableAuthorizationServer;

@Configuration
@EnableUrlSecurity
@EnableAuthorizationServer
@EnableUserInfoResource
public class AppContextConfig  {

	/*@Bean
	public RootMenuClassProvider menuConfig(){
		return ()->Systems.class;
	}*/

    @Bean
    public RootMenuClassListProvider menuConfig() {
        return () -> Arrays.asList(AdminMgr.class);
    }
}
