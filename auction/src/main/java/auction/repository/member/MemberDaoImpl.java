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
	
//	이하 사용자
//	회원가입
	@Override
	public int regist(Member member) {
		int result = sqlSession.insert("regist_user", member);
		log.debug("결과 = {}", result);
		return result;
	}

//	로그인 관련
	@Override
	public int login(String user_id, String encrypted_pw) {
		Map<String, Object> map = new HashMap<>();
		map.put("user_id", user_id);
		map.put("encrypted_pw", encrypted_pw);
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
	
//	이하 관리자
//	전체 회원수 
	@Override
	public int getListCount() {
		int count = sqlSession.selectOne("user_listCount");
		log.debug("결과 = {}", count);
		return count;
	}
	@Override
	public int getSearchCount(Map<String, Object> map) {
		int count = sqlSession.selectOne("user_searchCount", map);
		log.debug("결과 = {}", count);
		return count;
	}
	
//	회원 조회 및 검색
	@Override
	public List<Member> userList(Map<String, Object> map) {
		List<Member> list = sqlSession.selectList("user_list", map);
		for(Member member:list) {
			log.debug(member.toString());
		}
		return list;
	}
	@Override
	public List<Member> userSearch(Map<String, Object> map) {
		List<Member> list = sqlSession.selectList("user_search", map);
		for(Member member : list) {
			log.debug(member.toString());
		}
		return list;
	}

//	세션에 저장된 아이디로 회원고유번호 조회
	@Override
	public int getUser(String user_id) {
		int user_sq = sqlSession.selectOne("get_user", user_id);
		log.debug("결과 = {}", user_sq);
		return user_sq;
	}

//	특정 회원정보 조회
	@Override
	public Member find(int user_sq) {
		Member member = sqlSession.selectOne("find_user", user_sq);
		log.debug("결과 = {}", member);
		return member;
	}

//	특정 회원정보 수정
	@Override
	public void edit(Member member) {		
		int result = sqlSession.update("update_user", member);
		log.debug("결과 = {}", result);
	}

}