package com.nemo.admin.transaction.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nemo.admin.transaction.repository.impl.TransactionMapper;
import com.nemo.admin.transaction.service.TransactionService;
import com.nemo.user.purchases.vo.PurchasesVO;

@Service
public class TransactionServiceImpl implements TransactionService{
	@Autowired
	private TransactionMapper transDAO;

	@Override
	public List<PurchasesVO> allList() {
		// TODO Auto-generated method stub
		return transDAO.allList();
	}
}
