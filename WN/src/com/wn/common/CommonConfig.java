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
 * API����ʽ����
 */
public class CommonConfig extends JFinalConfig {
	


	

	public static void main(String[] args) {
		JFinal.start("WebRoot",80, "/",5);
	}
	
	
	/**
	 * ���ó���
	 */
	@Override
	public void configConstant(Constants me) {
		// TODO Auto-generated method stub
		loadPropertyFile("config.properties");   //�����������ã������getProperty�������ֵ
		me.setDevMode(getPropertyToBoolean("devMode", false));
		me.setViewType(ViewType.JSP);//��ͼ����
		
		
		//����http 404������ת
//		me.setError404View("404.html");
		//�����ļ����ص�ַ
//		me.setBaseDownloadPath("/download");
//		me.setUrlParaSeparator("-");
		
	}
	
	/**
	 * ����·��
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
	 * ���ò��
	 */
	@Override
	public void configPlugin(Plugins me) {
		
		//����C3p0���ݿ����ӳز��
		C3p0Plugin c3p0Plugin = new C3p0Plugin(getProperty("jdbcUrl"), getProperty("user"), getProperty("password").trim());
		 me.add(c3p0Plugin);
        //����ActiveRecord���
        ActiveRecordPlugin arp = new ActiveRecordPlugin(c3p0Plugin);
        me.add(arp);  
        
      //ӳ��users�� usersģ��
	   arp.addMapping("users", Users.class);
		
	}
	
	@Override
	public void configEngine(Engine me) {
		
		
   }
	@Override
	
	/**

	* ����ȫ�ִ�����
    */
	public void configHandler(Handlers me) {
		// TODO Auto-generated method stub
		me.add(new ContextPathHandler("contextPath"));
	}
  
	@Override
	/*
	 *  * ����ȫ��������
	 */
	public void configInterceptor(Interceptors me) {
		// TODO Auto-generated method stub
		
	}


}
