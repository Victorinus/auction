package auction.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor @Builder
public class Paging {
	private String art_artist;
	private String art_nm;
	private int lot;
	private int sn;
	private int fn;
}
