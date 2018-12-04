package auction.repository.myfav;

import java.util.List;

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

	@Override
	public int find(int a_sq, int art_sq) {
		Myfav myfav = Myfav.builder()
											.a_sq(a_sq)
											.art_sq(art_sq)
										.build();
		int result = sqlSession.selectOne("myfav_find", myfav);
		log.debug("결과 = {}", result);
		return result;
	}
	
	@Override
	public void insert(int a_sq, int art_sq) {
		Myfav myfav = Myfav.builder()
											.a_sq(a_sq)
											.art_sq(art_sq)
										.build();
		int result = sqlSession.insert("myfav_regist", myfav);
		log.debug("결과 = {}", result);
	}

	@Override
	public void delete(int a_sq, int art_sq) {
		Myfav myfav = Myfav.builder()
											.a_sq(a_sq)
											.art_sq(art_sq)
										.build();
		int result = sqlSession.delete("myfav_delete", myfav);
		log.debug("결과 = {}", result);
	}

	@Override
	public List<Integer> list(int user_no) {
		List<Integer> list = sqlSession.selectList("myfav_listByUser", user_no);
		for(Integer integer : list) {
			log.debug("결과 = {}", integer);
		}
		return list;
	}

	@Override
	public List<View> getMyfavList(int user_no) {
		List<View> list = sqlSession.selectList("myfav_listForUser", user_no);
		for(View view : list) {
			log.debug("결과 = {}", view);
		}
		return list;
	}

	
}
