package auction.entity;

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
public class Bid {
	private int bid_sq;
	private int a_sq;
	private int art_sq;
	private String user_id;
	private String bid_dt;
	private long bid_bp;
}
