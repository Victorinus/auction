package auction.repository.member;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import auction.entity.Member;

@Service("memberDao")
public class MemberDaoImpl implements MemberDao{
	
	@Autowired
	private SqlSession sqlSession;
	
	private Logger log = LoggerFactory.getLogger(getClass());
	
	//회원가입 등록을 위한 dao
	@Override
	public int regist(Member member) {
		//member를 받어와서 mapping된 db에 집어넣기
		int result = sqlSession.insert("regist_user", member);
		log.debug("회원가입결과={}", result);
		return result;
	}
	
	@Override
	public int login(String user_id, String user_pw) {
		Map<String, Object> map = new HashMap<>();
		map.put("user_id", user_id);
		map.put("user_pw", user_pw);
		int count = sqlSession.selectOne("login_user", map);
		log.debug("결과 = {}", count);
		return count;
	}
	
	@Override
	public String getGrade(String user_id) {
		String user_grade = sqlSession.selectOne("grade_user", user_id);
		log.debug("결과 = {}", user_grade);
		return user_grade;
	}
	
	//관리자페이지 회원목록 출력
	@Override
	public List<Member> userList() {
		List<Member> list = sqlSession.selectList("user_list");
		for(Member member:list) {
			log.debug(member.toString());
		}
		return list;
	}

	//세션에 저장된 아이디로 회원고유번호 조회
	@Override
	public int getUser(String user_id) {
		int user_sq = sqlSession.selectOne("get_user", user_id);
		log.debug("결과 = {}", user_sq);
		return user_sq;
	}	

}