package auction.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Auction {
	private int auction_sq;
	private String auction_nm;
	private String auction_info;
	private String auction_dt;
	private String auction_addr1;
	private String auction_start;
	private String auction_end;
	private String auction_type;
	private String auction_post;
	private String auction_addr2;
	private String auction_image;
}
