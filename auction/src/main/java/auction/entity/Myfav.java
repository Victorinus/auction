package auction.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Myfav {
	private int myfav_sq;
	private int myfav_user_no;
	private int myfav_art_no;
	private String myfav_dt;
}
