package auction.repository.member;

import java.util.List;

import org.springframework.stereotype.Service;

import auction.entity.Member;

@Service
public interface MemberDao {
	int regist(Member member);//회원가입
	List<Member> userList();//회원목록 출력(admin)
	int getListCnt();//총 회원수
	
}
