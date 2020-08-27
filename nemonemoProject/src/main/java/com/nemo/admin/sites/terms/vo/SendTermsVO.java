package com.nemo.admin.sites.terms.vo;

import lombok.Data;

@Data
public class SendTermsVO {
	private int termsNo;
	private String emailSender;
	private String termsTitle;
	private String termsContent;
	private String termsRequiredFl;
}
