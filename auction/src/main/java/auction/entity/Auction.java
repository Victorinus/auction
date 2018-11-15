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
	private String name;
	private String summary;
	private String addr;
	private String stime;
	private String etime;
	private String type;
}
