package com.putupiron.pufe.dto;

import java.util.Date;

import lombok.Data;

@Data
public class Machine {
	private	int		mch_num;
	private	String	mch_name;
	private	String	mch_img;
	private int		mch_serial;
	private	Date	mch_date;
	private	String	mch_info;
	private	String	mch_detail;
}
