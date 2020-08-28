package com.nemo.common.paging;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter @Setter
@ToString
public class PageVO {
		// 한번에 보여줄 페이지 개수
		private int pageSize;
		// 현재 페이지 번호
		private int pageNo;
		// 전체 페이지 개수
		private int totalPageSize;
		// 전체 그룹 개수
		private int totalGroupSize;
		// 한번에 보여줄 페이지 그룹 갯수
		private int groupSize;
		// 현재 페이지의 시작 그룹 번호
		private int startGroupNo;
		// 현재 페이지의 마지막 그룹 번호;
		private int endGroupNo;
		// 이전 버튼 유무
		private boolean prev;
		// 다음 버튼 유무
		private boolean next;
		
		/*  입력값 없을 시에 기본값 */
		public PageVO() {
			this.pageNo = 1;
			this.pageSize = 10; // 한번에 보여줄 게시물
			this.groupSize = 10; // 한번에 보여줄 그룹 수
		}
}
