package auction.repository.member;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import auction.entity.Member;

@Service
public interface MemberDao {
	int regist(Member member);
	
	int getListCount();
	
	int getSearchCount(Map<String, Object> map);
	
	List<Member> userList(Map<String, Object> map);

	List<Member> userSearch(Map<String, Object> map);
	
	int login(String user_id, String user_pw);

	String getGrade(String user_id);

	int getUser(String user_id);

	void delete(int user_sq);
}

