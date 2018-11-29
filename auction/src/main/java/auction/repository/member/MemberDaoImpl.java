package auction.repository.member;

import java.util.List;

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
	
	@Autowired
	private MemberDao memberdao;
	
	private Logger log = LoggerFactory.getLogger(getClass());
	
	//회원가입 등록을 위한 dao
	@Override
	public int regist(Member member) {
		//member를 받어와서 mapping된 db에 집어넣기
		int result = sqlSession.insert("regist_user", member);

			log.debug("회원가입결과={}", result);

		return result;
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
	
	

}
