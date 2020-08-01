package com.nemo.admin.sites.coupon.service.impl;

import java.sql.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nemo.admin.sites.coupon.repository.ICouponMapper;
import com.nemo.admin.sites.coupon.repository.impl.CouponMapper;
import com.nemo.admin.sites.coupon.service.InsertCouponService;
import com.nemo.admin.sites.coupon.vo.CouponVO;


@Service
public class InsertCouponServiceImpl implements InsertCouponService {
	
	@Autowired
	private CouponMapper couponDAO;

	@Override
	public int insertCoupon(CouponVO vo) {
		return couponDAO.insertCoupon(vo);
	}
}

//request 에서는 string 으로 받고
//response date로 

//스크립트