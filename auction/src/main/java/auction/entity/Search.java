package auction.entity;

import lombok.Data;

@Data
public class Search {
	private String art_artist;
	private String art_nm;
	private String art_eprice_min;
	private String art_eprice_max;
	private String lot;
	private String sortType;
}
