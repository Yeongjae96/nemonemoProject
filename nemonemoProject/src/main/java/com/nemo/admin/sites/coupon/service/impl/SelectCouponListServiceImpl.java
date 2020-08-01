package com.nemo.admin.sites.coupon.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nemo.admin.sites.coupon.repository.impl.CouponMapper;
import com.nemo.admin.sites.coupon.service.SelectCouponListService;
import com.nemo.admin.sites.coupon.vo.CouponVO;


@Service
public class SelectCouponListServiceImpl implements SelectCouponListService{

	@Autowired
	private CouponMapper couponDAO;
	
	@Override
	public List<CouponVO> getCouponList(CouponVO vo) {
		return couponDAO.getCouponList(vo);
	}
	
}
