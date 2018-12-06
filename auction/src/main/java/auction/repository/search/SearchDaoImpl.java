package auction.repository.search;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import auction.entity.View;
import auction.entity.search.Search;

@Repository("searchDao")
public class SearchDaoImpl implements SearchDao {

	private Logger log = LoggerFactory.getLogger(getClass());
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public int getListCount() {
		int count = sqlSession.selectOne("search_listCount");
		log.debug("count = {}", count);
		return count;
	}

	@Override
	public int getSearchCount(Search search) {
		sqlSession.selectOne("search_searchCount", search);
		return 0;
	}
	
	@Override
	public List<View> list() {
		List<View> list = sqlSession.selectList("search_list");
		for(View view : list) {
			log.debug("view = {}", view);
		}
		return list;
	}

}
