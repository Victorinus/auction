package auction.repository.member;

import org.springframework.stereotype.Service;

import auction.entity.Member;

@Service
public interface MemberDao {
	int regist(Member member);//회원가입 하는 메소드(반환값 0:성공, 1실패)
}
