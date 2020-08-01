package com.nemo.admin.sites.coupon.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nemo.admin.sites.coupon.repository.impl.CouponMapper;
import com.nemo.admin.sites.coupon.service.SelectCouponService;
import com.nemo.admin.sites.coupon.vo.CouponVO;


@Service
public class SelectCouponServiceImpl implements SelectCouponService{

	@Autowired
	private CouponMapper couponDAO;
	
	@Override
	public CouponVO getCoupon(String couponCd) {

		return couponDAO.getCoupon(couponCd);
	}

}
