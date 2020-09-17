package com.nemo.admin.members.qna.vo;

import java.util.List;

import com.nemo.common.paging.PageVO;
import com.nemo.user.customer.qna.vo.UserBaseQnaVO;
import lombok.Data;

@Data
public class UserQnaResVO {
	private List<UserBaseQnaVO> qnaVOList;
	private PageVO pageVO;
}
