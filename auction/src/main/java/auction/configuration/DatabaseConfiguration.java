package auction.configuration;

import javax.sql.DataSource;

import org.apache.commons.dbcp2.BasicDataSource;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * DB연결 설정 파일
 */
@Configuration
public class DatabaseConfiguration {
	
	@Bean
	public DataSource dataSource() {
		BasicDataSource source = new BasicDataSource();
		source.setDriverClassName("oracle.jdbc.OracleDriver");
		//집에서 접속 : 121.160.70.30:30001;
		source.setUrl("jdbc:oracle:thin:@121.160.70.30:30001");
		source.setUsername("sw5");
		source.setPassword("sw5");
		source.setMaxTotal(20);
		source.setMaxIdle(10);
		source.setMaxWaitMillis(3000);
		return source;
	}

}
