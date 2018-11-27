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
public class Paging {
	private String art_artist;
	private String art_nm;
	private int lot;
	private int sn;
	private int fn;
	private int art_eprice_min;
	private int art_eprice_max;
	private int no;
	
}
