package auction.entity;

import lombok.Data;

@Data
public class Current {
	private String eprice_min;
	private String eprice_max;
	private String title;
	private String artist;
	private int lot;
}
