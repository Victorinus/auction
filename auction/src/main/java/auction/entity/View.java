package auction.entity;

import lombok.Data;

@Data
public class View {
	private int lot;//rownum
	private int a_sq;
	private String a_nm;
	private String a_info;
	private String a_dt;//경매 등록일
	private String a_addr1;
	private String a_addr2;
	private String a_post;
	private String a_start;//경매 시작일
	private String a_end;///경매 종료일
	private String a_image;//대표 이미지
	private int art_sq;
	private String art_nm;
	private String art_info;
	private String art_info2;
	private String art_size;
	private String art_dt;//등록일
	private int art_bp;
	private String art_artist;
	private String art_image;//작품 이미지
	private String art_origin;
	private String art_medium;
	private String art_sign;
	private int art_eprice;
	private int art_ep;
	private String art_eval;
	private String art_status;
	private String art_cdt;//제작연도
}
