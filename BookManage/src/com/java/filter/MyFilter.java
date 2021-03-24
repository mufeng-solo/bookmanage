package com.java.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/*�жϷ��������*/
public class MyFilter implements Filter{

	public void init(FilterConfig filterConfig) throws ServletException {
		System.out.println("filter...init...");
	}
	
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
        String info = (String)((HttpServletRequest) request).getSession().getAttribute("admininfo");
//		String info = (String)request.getAttribute("admininfo");
		if(info!=null) {
			if(info.equals("login")) {
					chain.doFilter(request, response);//���������Ӧ����
			}else {
				request.getRequestDispatcher("error.jsp").forward(request, response);
			}
		}else {
//			request.getRequestDispatcher("error.jsp").forward(request, response);//����ת��
			((HttpServletResponse)response).sendRedirect("../admin_login.jsp");//�ض���
		}
	}

	@Override
	public void destroy() {

	}
}
