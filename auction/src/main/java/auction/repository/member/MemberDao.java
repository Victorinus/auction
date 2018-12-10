package auction.repository.member;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import auction.entity.Member;

@Repository
public interface MemberDao {
	int regist(Member member);
	
	int getListCount();
	
	int getSearchCount(Map<String, Object> map);
	
	List<Member> userList(Map<String, Object> map);

	List<Member> userSearch(Map<String, Object> map);
	
	int login(String user_id, String encrypted_pw);

	int getUser(String user_id);
	
	String getGrade(String user_id);

	Member find(int user_sq);

	void edit(Member member);

}

