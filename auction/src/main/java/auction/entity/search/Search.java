package auction.entity.search;

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
public class Search {
	
	private String date_st;
	private String date_fn;
	private String type;
	private String key;
	private String medium;
	
}
