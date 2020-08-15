package com.nemo.common.paging;

/**
 * @제목 : 페이지 객체를 만들어주는 Pagination 클래스
 * @패키지이름 : com.nemo.common.paging
 * @파일이름 : Pagination.java
 * @작성일 : 2020. 8. 15.
 * @이름 : Yeong
 * @프로그램설명 : 
 * @사용법 :
 * <pre>
 * 		Pagination paging = new Pagination(컨트롤러에서 입력받은 pageVO 객체);
 * 		paging.getStartPageNo();
 * 		paging.getEndPageNo();
 * ... DB 조회 후
 * 		PageVO page = paging.getCalcPageVO(DB조회값의 size);
 * 		return할 VO객체.setPageVO(page);
 * </pre>
 */
public class Pagination {

	//객체
	private PageVO pageVO;
	// DB 조회할 페이지 시작 번호
	private int startPageNo;
	// DB 조회할 페이지 끝 번호
	private int endPageNo;
	
	public Pagination(PageVO pageVO) {
		this.pageVO = pageVO;
		/* DB 조회용 startNum, endNum */
		this.startPageNo = calcStartPageNo();
		this.endPageNo = calcEndPageNo();
	}
	
	/** DB 조회용 시작 번호 */
	public int getStartPageNo() {
		return startPageNo;
	}
	/** DB 조회용 끝 번호 */
	public int getEndPageNo() {
		return endPageNo;
	}

	/** 페이지용 객체 반환*/
	public PageVO getCalcPageVO(int totalPageSize) {
		pageVO.setTotalPageSize(totalPageSize);
		/* 뿌려주기 위한 값 계산 */
		calcTotalGroupSize();
		calcStartGroupNo();
		calcEndGroupNo();
		calcIsPrev();
		calcIsNext();
		/* pageVO객체로 반환 */
		return pageVO;
	}
	
	/* 내부 로직 : DB 용*/

	private int calcStartPageNo() {
		return (pageVO.getPageNo()-1) * pageVO.getPageSize() + 1;
	}
	
	private int calcEndPageNo() {
		return pageVO.getPageNo() * pageVO.getPageSize();
	}
	
	/* 내부 로직 : 페이지 용 */
	
	private void calcTotalGroupSize() {
		int totalGroupSize = (pageVO.getTotalPageSize() % pageVO.getGroupSize()) == 0 ?  // 전체 페이지 개수에서 한번에 보여줄 그룹이 나누어 떨어지면
				(pageVO.getTotalPageSize() / pageVO.getGroupSize()) : 
				(pageVO.getTotalPageSize() / pageVO.getGroupSize() + 1); // 나눈 값 :  나눈 값+1
		
		pageVO.setTotalGroupSize(totalGroupSize);
	}
	
	private void calcStartGroupNo() { // 시작 그룹 번호 계산
		int startGroupNo = (pageVO.getPageNo() - 1) / pageVO.getGroupSize() * pageVO.getGroupSize() + 1;
		pageVO.setStartGroupNo(startGroupNo);
	}
	
	// 총 그룹 개수 구하기
	private void calcEndGroupNo() { // 마지막 그룹 번호 계산
		int endGroupNo = (pageVO.getStartGroupNo() * pageVO.getGroupSize() > pageVO.getTotalGroupSize()) ?  
				pageVO.getTotalGroupSize() : (pageVO.getStartGroupNo() * pageVO.getGroupSize());
		
		pageVO.setEndGroupNo(endGroupNo);
	} 
	
	private void calcIsPrev() { // 이전 버튼을 사용할 유무
		boolean prev = (pageVO.getStartGroupNo() != 1);
		pageVO.setPrev(prev);
	}
	
	private void calcIsNext() { // 다음 버튼을 사용할 유무
		boolean next = (pageVO.getEndGroupNo() < pageVO.getTotalGroupSize());
		pageVO.setNext(next);

	}
	
}
