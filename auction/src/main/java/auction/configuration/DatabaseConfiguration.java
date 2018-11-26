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
	//DB연결하기
	@Bean
	public DataSource dataSource() {
		BasicDataSource source = new BasicDataSource();
		source.setDriverClassName("oracle.jdbc.OracleDriver");
		//집에서 접속 : 121.160.70.30:30001;
//		source.setUrl("jdbc:oracle:thin:@121.160.70.30:30001:xe");
//		source.setUrl("jdbc:oracle:thin:@192.168.6.38:1521:xe");
		source.setUrl("jdbc:oracle:thin:@localhost:1522:xe");
		source.setUsername("sw5");
		source.setPassword("sw5");
//		source.setUrl("jdbc:oracle:thin:@localhost:1521:xe");
//		source.setUsername("sw4");
//		source.setPassword("sw4");
		source.setMaxTotal(20);
		source.setMaxIdle(10);
		source.setMaxWaitMillis(3000);
		return source;
	}

}
