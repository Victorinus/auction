package auction.entity;

import org.springframework.stereotype.Component;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor @Builder
@Component
public class Member {
	private int rn;
	private int user_sq;
	private String user_id;
	private String user_pw;
	private String user_nm;
	private String user_birth;
	private String user_gender;
	private String user_phone;
	private String user_tel;
	private String user_email;
	private String user_post;
	private String user_addr1;
	private String user_addr2;
	private String user_grade;
	private String reg_dt;
	private String chg_dt;

}
