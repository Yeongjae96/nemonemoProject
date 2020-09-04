package com.nemo.user.pusrchases.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nemo.user.pusrchases.repository.impl.PurchaseMapper;
import com.nemo.user.pusrchases.service.PurchaseService;

@Service
public class PurchaseServiceImpl implements PurchaseService{
	@Autowired
	private PurchaseMapper userDAO;
}
