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
import auction.entity.Eval;
import auction.entity.Page;

@Service("artDao")
public class ArtDaoImpl implements ArtDao {

	@Autowired
	private SqlSession sqlSession;
	
	private Logger log = LoggerFactory.getLogger(getClass()); 
	
	@Override
	public void insert(Art art) {
		int result = sqlSession.insert("admin_art_regist", art);
		log.debug("결과값 = {}", result);
	}

	@Override
	public List<Art> list() {
		List<Art> list = sqlSession.selectList("admin_art_list");
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
		List<Art> list = sqlSession.selectList("admin_art_listPage", map);
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
		List<Art> list = sqlSession.selectList("admin_art_search", map);
		for(Art art : list) {
			log.debug("결과 = {}", art);
		}
		return list;
	}

	@Override
	public int getListCnt() {
		int result = sqlSession.selectOne("admin_art_listCnt");
		log.debug("결과값 = {}", result);
		return result;
	}
	
	@Override
	public int getSearchCnt(String searchType, String searchKey) {
		Map<String, String> map = new HashMap<>();
		map.put("searchType", searchType);
		map.put("searchKey", searchKey);
		int result = sqlSession.selectOne("admin_art_searchCnt", map);
		log.debug("결과값 = {}", result);
		return result;
	}
	
	@Override
	public Art find(int art_sq) {
		Art art = sqlSession.selectOne("admin_art_find", art_sq);
		log.debug(art.toString());
		return art;
	}

	@Override
	public void edit(Art art) {
		int result = sqlSession.update("admin_art_edit", art);
		log.debug("결과값 = {}", result);
	}

	@Override
	public void delete(int art_sq) {
		int result = sqlSession.delete("admin_art_delete", art_sq);
		log.debug("결과값 = {}", result);
	}

	@Override
	public int getEvalListCnt() {
		int result = sqlSession.selectOne("admin_art_evalListCnt");
		log.debug("결과값 = {}", result);
		return result;
	}

	@Override
	public int getEvalSearchCnt(String searchType, String searchKey) {
		Map<String, String> map = new HashMap<>();
		map.put("searchType", searchType);
		map.put("searchKey", searchKey);
		int result = sqlSession.selectOne("admin_art_evalSearchCnt", map);
		log.debug("결과값 = {}", result);
		return result;
	}

	@Override
	public List<Eval> evalList(Page page, String sortType) {
		Map<String, Object> map = new HashMap<>();
		map.put("page", page);
		map.put("sortType", sortType);
		List<Eval> list = sqlSession.selectList("admin_art_evalListPage", map);
		for(Eval eval : list) {
			log.debug("결과 = {}", eval);
		}
		return list;
	}

	@Override
	public List<Eval> evalSearch(Page page, String sortType, String searchType, String searchKey) {
		Map<String, Object> map = new HashMap<>();
		map.put("page", page);
		map.put("sortType", sortType);
		map.put("searchType", searchType);
		map.put("searchKey", searchKey);
		List<Eval> list = sqlSession.selectList("admin_art_evalSearch", map);
		for(Eval eval : list) {
			log.debug("결과 = {}", eval);
		}
		return list;
	}

	@Override
	public void evalReg(Eval eval) {
		Map<String, Object> map = new HashMap<>();
		int result = sqlSession.update("admin_art_eval", eval);
		log.debug("결과값 = {}", result);
	}

	@Override
	public List<Art> getEntryList() {
		List<Art> list = sqlSession.selectList("admin_art_getEntry");
		return list;
	}

}
