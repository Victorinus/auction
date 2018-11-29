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
public class Art {
        private int art_sq;
        private String art_nm;
        private String art_info;
        private String art_info2;
        private String art_size;
        private String art_cdt;
        private int art_bp;
        private String art_artist;
        private String art_image;
        private String art_origin;
        private String art_medium;
        private String art_sign;
        private int art_ep;
        private String art_eval;
        private String art_status;
        private String art_dt;
        
}
