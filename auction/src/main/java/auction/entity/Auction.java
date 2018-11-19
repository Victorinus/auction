package auction.entity;

import lombok.Data;

@Data
public class Auction {
	private int auction_no;
	private String name;
	private String summary;
	private String reg;
	private String addr;
	private String stime;
	private String etime;
	private String type;
	private String post;
	private String addr2;
}
