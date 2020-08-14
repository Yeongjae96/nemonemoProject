package com.nemo.common.constrants;

import lombok.Getter;

@Getter
public enum DirectoryName {
		
		USER("/upload/user/"),
		STORE("/upload/store/"),
		ADMIN("/upload/admin/"),
		QNA("/upload/qna/"),
		PRODUCT(PathBean.product),
		BANNER("/upload/banner/");

		private String directoryName;
	
		private DirectoryName(String directoryName) {
			this.directoryName = directoryName;
		}
}
