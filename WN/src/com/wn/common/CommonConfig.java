package com.wn.common;




import com.wn.common.controller.UsersController;

import com.wn.common.model.Users;

import com.jfinal.config.Constants;
import com.jfinal.config.Handlers;
import com.jfinal.config.Interceptors;
import com.jfinal.config.JFinalConfig;
import com.jfinal.config.Plugins;
import com.jfinal.config.Routes;

import com.jfinal.core.JFinal;
import com.jfinal.ext.handler.ContextPathHandler;
import com.jfinal.plugin.activerecord.ActiveRecordPlugin;

import com.jfinal.plugin.c3p0.C3p0Plugin;
import com.jfinal.render.ViewType;
import com.jfinal.template.Engine;
/**
 * API引导式配置
 */
public class CommonConfig extends JFinalConfig {
	


	

	public static void main(String[] args) {
		JFinal.start("WebRoot",80, "/",5);
	}
	
	
	/**
	 * 配置常量
	 */
	@Override
	public void configConstant(Constants me) {
		// TODO Auto-generated method stub
		loadPropertyFile("config.properties");   //加载少量配置，随后用getProperty（）获得值
		me.setDevMode(getPropertyToBoolean("devMode", false));
		me.setViewType(ViewType.JSP);//视图类型
		
		
		//设置http 404错误跳转
//		me.setError404View("404.html");
		//设置文件下载地址
//		me.setBaseDownloadPath("/download");
//		me.setUrlParaSeparator("-");
		
	}
	
	/**
	 * 配置路由
	 */
	@Override
	public void configRoute(Routes me) {
		
//		 me.add("/", UsersController.class);
	   me.add("/users", UsersController.class);
	  
//	   me.add("/wnjk", wnjkController.class);
	   me.setBaseViewPath("WEB-INF/view");
//	   me.setBaseViewPath("WEB-INF");
	  }
	
	/**
	 * 配置插件
	 */
	@Override
	public void configPlugin(Plugins me) {
		
		//配置C3p0数据库连接池插件
		C3p0Plugin c3p0Plugin = new C3p0Plugin(getProperty("jdbcUrl"), getProperty("user"), getProperty("password").trim());
		 me.add(c3p0Plugin);
        //配置ActiveRecord插件
        ActiveRecordPlugin arp = new ActiveRecordPlugin(c3p0Plugin);
        me.add(arp);  
        
      //映射users表到 users模型
	   arp.addMapping("users", Users.class);
		
	}
	
	@Override
	public void configEngine(Engine me) {
		
		
   }
	@Override
	
	/**

	* 配置全局处理器
    */
	public void configHandler(Handlers me) {
		// TODO Auto-generated method stub
		me.add(new ContextPathHandler("contextPath"));
	}
  
	@Override
	/*
	 *  * 配置全局拦截器
	 */
	public void configInterceptor(Interceptors me) {
		// TODO Auto-generated method stub
		
	}


}
