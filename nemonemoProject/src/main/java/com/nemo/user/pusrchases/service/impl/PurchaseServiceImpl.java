package com.nemo.user.pusrchases.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nemo.user.purchases.vo.PurchasesVO;
import com.nemo.user.pusrchases.repository.impl.PurchaseMapper;
import com.nemo.user.pusrchases.service.PurchaseService;

@Service
public class PurchaseServiceImpl implements PurchaseService{
	@Autowired
	private PurchaseMapper purchaseDAO;

	@Override
	public int insertPay(PurchasesVO vo) {
		// TODO Auto-generated method stub
		return purchaseDAO.insertPay(vo);
	}

	@Override
	public List<PurchasesVO> buyList(PurchasesVO vo) {
		// TODO Auto-generated method stub
		return purchaseDAO.buyList(vo);
	}

	@Override
	public List<PurchasesVO> sellList(PurchasesVO vo) {
		// TODO Auto-generated method stub
		return purchaseDAO.sellList(vo);
	}

	@Override
	public int upPaySt(PurchasesVO vo) {
		// TODO Auto-generated method stub
		return purchaseDAO.upPaySt(vo);
	}

	@Override
	public int purchasecheck(int productNo) {
		// TODO Auto-generated method stub
		return purchaseDAO.purchasecheck(productNo);
	}

	@Override
	public List<PurchasesVO> getSelectList(PurchasesVO vo) {
		// TODO Auto-generated method stub
		return purchaseDAO.getSelectList(vo);
	}


}
