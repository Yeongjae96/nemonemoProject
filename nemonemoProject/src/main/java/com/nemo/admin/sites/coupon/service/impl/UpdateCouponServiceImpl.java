package com.nemo.admin.sites.coupon.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nemo.admin.sites.coupon.repository.CouponDAO;
import com.nemo.admin.sites.coupon.service.UpdateCouponService;
import com.nemo.admin.sites.coupon.vo.CouponVO;

@Service
public class UpdateCouponServiceImpl implements UpdateCouponService{

	@Autowired private CouponDAO couponDAO;
	
	@Override
	public int updateCoupon(CouponVO vo) {
		return couponDAO.updateCoupon(vo);
	}

}
