package org.onetwo.webapp.manager.util;

import java.util.Map;

import org.onetwo.plugins.admin.AdminModule;

import com.google.common.collect.ImmutableMap;




public interface Systems {
	String name = "后台管理系统";
	String appCode = Systems.class.getSimpleName();
	
	Class<?>[] children = new Class<?>[]{AdminModule.class};
	
	Map<String, Object> meta = ImmutableMap.of("test", "testValue",
											   "key", "keyValue");
	
	/*@ProxyMenu(value=AdminModule.class)
	public interface AdminMgr {
	}*/

}
