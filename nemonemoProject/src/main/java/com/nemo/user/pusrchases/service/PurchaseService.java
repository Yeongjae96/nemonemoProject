package com.nemo.user.pusrchases.service;

import java.util.List;

import com.nemo.user.purchases.vo.PurchasesVO;

public interface PurchaseService {
	public int insertPay(PurchasesVO vo);
	public int upPaySt(PurchasesVO vo);
	public int purchasecheck(int productNo);
	public List<PurchasesVO> buyList(PurchasesVO vo);
	public List<PurchasesVO> sellList(PurchasesVO vo);
	public List<PurchasesVO> getSelectList(PurchasesVO vo);
}
