package com.nemo.admin.sites.faq.repository.impl;

import org.apache.ibatis.annotations.Mapper;

import com.nemo.admin.sites.faq.repository.IFaqMapper;
import com.nemo.admin.sites.faq.vo.AdminBaseFaqVO;

@Mapper
public interface FaqMapper extends IFaqMapper {
	
	public int updateUseFlag(AdminBaseFaqVO vo); 
}
