package com.nemo.common.constraints;

import lombok.Getter;

@Getter
public enum ResponseResult {
	
	SUCCESS("success"),
	LOGIN_FAIL("fail:login");
	
	private String result;
	
	private ResponseResult(String result) {
		this.result = result;
	}
}
