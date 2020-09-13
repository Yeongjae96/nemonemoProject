package com.nemo.user.pusrchases.repository;

import java.util.List;

import com.nemo.user.purchases.vo.PurchasesVO;


public interface IPurchaseMapper {
	public int insertPay(PurchasesVO vo);
	public int upPaySt(PurchasesVO vo);
	public int purchasecheck(int productNo);
	public List<PurchasesVO> buyList(PurchasesVO vo);
	public List<PurchasesVO> sellList(PurchasesVO vo);
}
