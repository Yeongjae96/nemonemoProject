package com.nemo.admin.transaction.repository;

import java.util.List;

import com.nemo.user.purchases.vo.PurchasesVO;

public interface ITransactionMapper {
	public List<PurchasesVO> allList();
}
