package auction.configuration;

import java.io.IOException;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * Mybatis 사용 설정
 */
@Configuration
public class MybatisConfiguration {
	@Bean
	public SqlSessionFactoryBean sqlSessionFactory(
			DataSource dataSource, ApplicationContext applicationContext) throws IOException {
		SqlSessionFactoryBean bean = new SqlSessionFactoryBean();
		bean.setDataSource(dataSource);
		bean.setConfigLocation(applicationContext.getResource("classpath:/auction/mybatis/mybatis_config.xml"));
		bean.setMapperLocations(applicationContext.getResources("classpath:/auction/mybatis/mapper/*_mapper.xml"));
		return bean;
	}
	
	@Bean
	public SqlSessionTemplate sqlSession(SqlSessionFactory sqlSessionFactory) {
		SqlSessionTemplate template = new SqlSessionTemplate(sqlSessionFactory);
		return template;
	}
}
