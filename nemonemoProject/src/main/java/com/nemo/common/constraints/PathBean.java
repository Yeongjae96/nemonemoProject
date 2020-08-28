package com.nemo.common.constraints;

import org.springframework.beans.factory.annotation.Value;

public class PathBean {
	
	public static String product;
	public static String user;
	public static String admin;
	public static String qna;
	public static String banner;
	public static String store;
	
	@Value("${dir.product}")
	public void setProduct(String product) {
		PathBean.product = product;
	}
	public void setUser(String user) {
		PathBean.user = user;
	}
	public void setAdmin(String admin) {
		PathBean.admin = admin;
	}
	@Value("${dir.qna}")
	public void setQna(String qna) {
		PathBean.qna = qna;
	}
	public void setBanner(String banner) {
		PathBean.banner = banner;
	}
	@Value("${dir.store}")
	public void setStore(String store) {
		PathBean.store = store;
	}
	
	
}	
