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
public class Eval {
        private int art_sq;
        private int art_ep;
        private String art_eval;
        private String art_status;
        private String art_nm;
        private String art_artist;
        private String art_image;
}
