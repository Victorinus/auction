package auction.repository.art;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import auction.entity.Art;
import auction.entity.Page;

@Service("artDao")
public class ArtDaoImpl implements ArtDao {

	@Autowired
	private SqlSession sqlSession;
	
	private Logger log = LoggerFactory.getLogger(getClass()); 
	
	@Override
	public void insert(Art art) {
		int result = sqlSession.insert("regist", art);
		log.debug("결과값 = {}", result);
	}

	@Override
	public List<Art> list() {
		List<Art> list = sqlSession.selectList("list");
		for(Art art : list) {
			log.debug("결과 = {}", art);
		}
		return list;
	}
	
	@Override
	public List<Art> list(Page page, String sortType) {
		Map<String, Object> map = new HashMap<>();
		map.put("page", page);
		map.put("sortType", sortType);
		List<Art> list = sqlSession.selectList("listPage", map);
		for(Art art : list) {
			log.debug("결과 = {}", art);
		}
		return list;
	}
	
	@Override
	public List<Art> search(Page page, String sortType, String searchType, String searchKey) {
		Map<String, Object> map = new HashMap<>();
		map.put("page", page);
		map.put("sortType", sortType);
		map.put("searchType", searchType);
		map.put("searchKey", searchKey);
		List<Art> list = sqlSession.selectList("search", map);
		for(Art art : list) {
			log.debug("결과 = {}", art);
		}
		return list;
	}

	@Override
	public int getListCnt() {
		int result = sqlSession.selectOne("listCnt");
		log.debug("결과값 = {}", result);
		return result;
	}
	
	@Override
	public int getSearchCnt(String searchType, String searchKey) {
		Map<String, String> map = new HashMap<>();
		map.put("searchType", searchType);
		map.put("searchKey", searchKey);
		int result = sqlSession.selectOne("searchCnt", map);
		log.debug("결과값 = {}", result);
		return result;
	}
	
	@Override
	public Art find(int art_sq) {
		Art art = sqlSession.selectOne("find", art_sq);
		log.debug(art.toString());
		return art;
	}

	@Override
	public void edit(Art art) {
		int result = sqlSession.update("edit", art);
		log.debug("결과값 = {}", result);
	}

	@Override
	public void delete(int art_sq) {
		int result = sqlSession.delete("delete", art_sq);
		log.debug("결과값 = {}", result);
	}


	
}
