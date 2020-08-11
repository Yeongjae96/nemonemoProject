package com.nemo.admin.sites.coupon.service;

import java.util.List;

import com.nemo.admin.sites.coupon.vo.CouponVO;

public interface SelectCouponListService {
	public List<CouponVO> getCouponList(CouponVO vo);
}
