package com.nemo.common.util;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.context.ContextLoader;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

/**
 * @제목 : 컨텍스트 유틸
 * @패키지이름 : com.nemo.common
 * @파일이름 : ContextUtil.java
 * @작성일 : 2020. 7. 27.
 * @이름 : Yeong
 * @프로그램설명 : Controller 이외의 Service나 Repository에서 Request나 Session을 사용할 수 있는 ContextUtil
 * 	또한 request나 session에 값을 넣을 수 도 있다.
 * == 수정 정보 ==
 *
 * DATE		 AUTHOR			NOTE
 * -------	--------	-------------	
 */
public class ContextUtil {
	/**
     * 빈을 직접 얻습니다.
     *
     * @param beanName
     * @return
     */
    public static Object getBean(String beanName) {
        WebApplicationContext context = ContextLoader.getCurrentWebApplicationContext();
        return context.getBean(beanName);
    }

    /**
     * HttpServletReqeust 객체를 직접 얻습니다.
     * @return
     */
    public static HttpServletRequest getRequest() {
        ServletRequestAttributes attr = (ServletRequestAttributes)RequestContextHolder.currentRequestAttributes();
        return attr.getRequest();
    }

    /**
     * HttpServletResponse 객체를 직접 얻습니다.
     * @return
     */
    public static HttpServletResponse getResponse() {
        ServletRequestAttributes attr = (ServletRequestAttributes)RequestContextHolder.currentRequestAttributes();
        return attr.getResponse();
    }

    /**
     * HttpSession 객체를 직접 얻습니다.
     *
     * @param gen 새 세션 생성 여부
     * @return
     */
    public static HttpSession getSession(boolean gen) {
        return ContextUtil.getRequest().getSession(gen);
    }

    /**
     * REQUEST 영역에서 가져오기
     *
     * @param key
     * @return
     */
    public static Object getAttrFromRequest(String key) {
        ServletRequestAttributes attr = (ServletRequestAttributes)RequestContextHolder.currentRequestAttributes();
        return attr.getAttribute(key, ServletRequestAttributes.SCOPE_REQUEST);
    }

    /**
     * REQUEST 영역에 객체 저장
     *
     * @param key
     * @param obj
     */
    public static void setAttrToRequest(String key, Object obj) {
        ServletRequestAttributes attr = (ServletRequestAttributes)RequestContextHolder.currentRequestAttributes();
        attr.setAttribute(key, obj, ServletRequestAttributes.SCOPE_REQUEST);
    }

    /**
     * SESSION 영역에서 가져오기
     *
     * @param key
     * @return
     */
    public static Object getAttrFromSession(String key) {
        ServletRequestAttributes attr = (ServletRequestAttributes)RequestContextHolder.currentRequestAttributes();
        return attr.getAttribute(key, ServletRequestAttributes.SCOPE_SESSION);
    }

    /**
     * Session 영역에 객체 저장
     *
     * @param key
     * @param obj
     */
    public static void setAttrToSession(String key, Object obj) {
        ServletRequestAttributes attr = (ServletRequestAttributes)RequestContextHolder.currentRequestAttributes();
        attr.setAttribute(key, obj, ServletRequestAttributes.SCOPE_SESSION);
    }
}
