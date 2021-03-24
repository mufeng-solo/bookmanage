package com.java.listener;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Component;

import com.java.service.UserService;

//����������
//@WebListener
//@Component
public class TomcatListen implements ServletContextListener{
	

	@Override
    public void contextInitialized(ServletContextEvent servletContextEvent) {
        System.out.println("tomcat��������ʼ��������");
        ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
        UserService userService = (UserService)context.getBean("userService");
        userService.forceLogout();
    }

    @Override
    public void contextDestroyed(ServletContextEvent servletContextEvent) {
        System.out.println("tomcat�������ر��ˡ�����");
        
    }

}
