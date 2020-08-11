package com.nemo.admin.sites.coupon.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nemo.admin.sites.coupon.repository.impl.CouponMapper;
import com.nemo.admin.sites.coupon.service.DeleteCouponService;



@Service
public class DeleteCouponServiceImpl implements DeleteCouponService {

	@Autowired
	private CouponMapper couponDAO;

	@Override
	public int deleteCoupon(int couponNo) {
		return couponDAO.deleteCoupon(couponNo);
	}
	
}
