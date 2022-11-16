package com.putupiron.pufe.dto;

import lombok.Data;
import lombok.NoArgsConstructor;
 
@Data
@NoArgsConstructor
public class BigThree {
	private	int		ranking;
	private	String	user_email;
	private	String	user_name;
	private	int		big3;
	private	int		squat;
	private	int		benchpress;
	private int		deadlift;
	
	public BigThree(String user_email, int squat, int benchpress, int deadlift) {
		super();
		this.user_email = user_email;
		this.squat = squat;
		this.benchpress = benchpress;
		this.deadlift = deadlift;
	}
}
