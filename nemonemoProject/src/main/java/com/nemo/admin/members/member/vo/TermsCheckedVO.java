package com.nemo.admin.members.member.vo;

import java.sql.Date;
import lombok.Data;

@Data
public class TermsCheckedVO {
	
	private int termsHistNo;
	private int termsNo;
	private int userNo;
	private String termsAgreeFl;
	private Date termsAgreeYmd;
	private String termsTitle;
	

}
