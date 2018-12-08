package auction.repository.myfav;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import auction.entity.myfav.Myfav;
import auction.entity.myfav.View;

@Repository
public class MyfavDaoImpl implements MyfavDao {

	private Logger log = LoggerFactory.getLogger(getClass());
	
	@Autowired
	private SqlSession sqlSession;
// 이하 사용자
//	관심작품 등록여부 확인
	@Override
	public int find(int user_sq, int a_sq, int art_sq) {
		Myfav myfav = Myfav.builder()
											.user_sq(user_sq)
											.a_sq(a_sq)
											.art_sq(art_sq)
										.build();
		int result = sqlSession.selectOne("myfav_find", myfav);
		log.debug("결과 = {}", result);
		return result;
	}
	
//	관심작품 등록
	@Override
	public void insert(int user_sq, int a_sq, int art_sq) {
		Myfav myfav = Myfav.builder()
											.user_sq(user_sq)
											.a_sq(a_sq)
											.art_sq(art_sq)
										.build();
		int result = sqlSession.insert("myfav_regist", myfav);
		log.debug("결과 = {}", result);
	}
	
//	관심작품 해제
	@Override
	public void delete(int user_sq, int a_sq, int art_sq) {
		Myfav myfav = Myfav.builder()
											.user_sq(user_sq)
											.a_sq(a_sq)
											.art_sq(art_sq)
										.build();
		int result = sqlSession.delete("myfav_delete", myfav);
		log.debug("결과 = {}", result);
	}

//	등록된 관심작품 목록
//	진행경매 화면
	@Override
	public List<Integer> list(int user_sq) {
		List<Integer> list = sqlSession.selectList("myfav_listByUser", user_sq);
		for(Integer integer : list) {
			log.debug("결과 = {}", integer);
		}
		return list;
	}
//	사용자 마이페이지 화면
	@Override
	public List<View> getMyfavList(int user_sq) {
		List<View> list = sqlSession.selectList("myfav_listForUser", user_sq);
		for(View view : list) {
			log.debug("결과 = {}", view);
		}
		return list;
	}

//	이하 관리자
//	전체 관심작품수 
	@Override
	public int getListCount() {
		int count = sqlSession.selectOne("myfav_listCount");
		log.debug("결과 = {}", count);
		return count;
	}
	@Override
	public int getSearchCount(Map<String, Object> map) {
		int count = sqlSession.selectOne("myfav_searchCount", map);
		log.debug("결과 = {}", count);
		return count;
	}

//	관심작품 조회 및 검색
	@Override
	public List<View> getAdminMyfavList(Map<String, Object> map) {
		List<View> list = sqlSession.selectList("myfav_listForAdmin", map);
		for(View view : list) {
			log.debug("결과 = {}", view);
		}
		return list;
	}
	@Override
	public List<View> getAdminMyfavSearch(Map<String, Object> map) {
		List<View> list = sqlSession.selectList("myfav_searchForAdmin", map);
		for(View view : list) {
			log.debug("결과 = {}", view);
		}
		return list;
	}
	
//	

	
}
