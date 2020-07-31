package com.nemo.admin.sites.coupon.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nemo.admin.sites.coupon.repository.CouponDAO;
import com.nemo.admin.sites.coupon.service.DeleteCouponService;



@Service
public class DeleteCouponServiceImpl implements DeleteCouponService {

	@Autowired
	private CouponDAO couponDAO;

	@Override
	public int deleteCoupon(String couponCd) {
		return couponDAO.deleteCoupon(couponCd);
	}
	
}
