package auction.entity;

import lombok.Data;

@Data
public class Search {
	private String artist;
	private String title;
	private String eprice_min;
	private String eprice_max;
	private int lot;
}
