package auction.entity.myfav;

import org.springframework.stereotype.Component;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Component
public class Myfav {
	
	private int myfav_sq;
	private int user_no;
	private int auction_no;
	private int art_no;
	private String myfav_dt;
	
	private int user_sq;
	private int a_sq;
	private int art_sq;
}
