package com.nemo.common.constrants;

import lombok.Getter;

@Getter
public enum DirectoryName {
		
		USER("/user/"),
		STORE("/store/"),
		ADMIN("/admin/"),
		QNA("/qna/"),
		PRODUCT("/product/"),
		BANNER("/banner/");

		private String directoryName;
	
		private DirectoryName(String directoryName) {
			this.directoryName = directoryName;
		}
}
