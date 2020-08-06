package com.nemo.user.customer.service;

import java.util.Map;

public interface CustomerFaqService {
	public int getFaqCategoryStartNum();
	public Map<String, Object> getFaqCategoryListAndSelectFaqList(int faqCategoryNo);
}
