package com.nemo.admin.commons.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.mybatis.logging.Logger;
import org.mybatis.logging.LoggerFactory;
import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.nemo.admin.management.vo.ManagementVO;

public class LoginInterceptor extends HandlerInterceptorAdapter {
	private static final String Admin = "admin";
	
	
	@Override
	public void postHandle(HttpServletRequest request ,HttpServletResponse response , Object handler , ModelAndView modelAndView)throws Exception {
		
		HttpSession httpSession = request.getSession();
		ModelMap modelMap = modelAndView.getModelMap();
		Object managementVO = modelMap.get("admin");
		
		if(managementVO!=null) {
			httpSession.setAttribute(Admin, managementVO);
			response.sendRedirect("/management/login.mdo");
		}
	
	}
	
	
	@Override
	public boolean preHandle(HttpServletRequest request,HttpServletResponse response,Object handler)throws Exception{
		
		HttpSession httpSession = request.getSession();
		
		if(httpSession.getAttribute(Admin)!=null) {
			httpSession.removeAttribute(Admin);
		}
		
		return true;
	}
	
}
