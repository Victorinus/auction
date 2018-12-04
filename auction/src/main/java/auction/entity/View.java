package auction.entity;

import lombok.Data;

@Data
public class View {
	private int lot;//rownum
	private int a_sq;
	private String a_nm;
	private String a_dt;//경매 등록일
	private String a_addr1;
	private String a_start;//경매 시작일
	private String a_end;///경매 종료일
	private String a_image;//대표 이미지
	private int art_sq;
	private String art_nm;
	private String art_artist;
	private String art_size;
	private String art_dt;//제작년도
	private String art_image;//작품 이미지
	private String art_origin;
	private String art_medium;
	private String art_sign;
	private int art_eprice;
}
