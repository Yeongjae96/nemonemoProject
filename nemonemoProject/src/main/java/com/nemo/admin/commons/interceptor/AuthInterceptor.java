package com.nemo.admin.commons.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.nemo.admin.management.vo.ManagementVO;

public class AuthInterceptor extends HandlerInterceptorAdapter {


	private static final Logger logger = LoggerFactory.getLogger(AuthInterceptor.class);

	static final String[] EXCLUDE_URL_LIST = { "/login" };

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		System.out.println("동작한다");
		String reqUrl = request.getRequestURL().toString();
		System.out.println("reqUrl : " + reqUrl);
		for (String target : EXCLUDE_URL_LIST) {
			if (reqUrl.indexOf(target) > -1) {
				return true;
			}
		}

		HttpSession session = request.getSession();
		System.out.println("세션 : " + session.getAttribute("admin"));
		ManagementVO admin = (ManagementVO) session.getAttribute("admin");

		if (admin == null) {
			logger.info(">> interceptor catch!!! userId is null.. ");
			session.invalidate();
			response.sendRedirect(request.getContextPath() + "/management/login.mdo");

			return false;
		}

		return true;

//        HttpSession session = request.getSession();
//        System.out.println("실행됨");
//        // 1. 자동 로그인 쿠키가 있는지 확인.
//        // -> 쿠키(loginCookie)의 존재 여부 확인.
//        Cookie loginCookie = WebUtils.getCookie(request, "loginCookie");
//        System.out.println("interceptor : " + loginCookie);
//        if(loginCookie != null) { // 자동 로그인을 했다면,
//           // 2. DB에서 쿠키값과 일치하는 세션아이디를 가진 회원의 정보를 조회.
//           ManagementVO admin = service.getUserWithSessionId(loginCookie.getValue());
//           if(admin != null) {
//              session.setAttribute("admin", admin);
//           }
//           System.out.println("loginCookie" + loginCookie);
//        }
//        
//        return true;
//    }    

	}
}
