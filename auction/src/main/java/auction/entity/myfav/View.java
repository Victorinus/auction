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
public class View {
	
	private int fav_sq;
	private int fav_user_no;
	private String fav_user_id;
	private int fav_auction_no;
	private String fav_auction_nm;
	private int fav_art_no;
	private String fav_art_nm;
	private String fav_art_artist;
	private String fav_dt;
	
}
