package com.nemo.user.products.vo;

import java.util.List;

import com.nemo.common.paging.PageVO;

import lombok.Data;

@Data
public class UserProductsManageResVO {
	private List<UserProductsManageVO> productsManageVOList;
	private PageVO pageVO;
}
