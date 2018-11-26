package auction.util;

import java.util.UUID;

import org.springframework.stereotype.Service;

@Service
public class UUIDUtil {
	
	/**
	 * 파일이름에 고유한 값을 부여하기 위해 랜덤 문자열을 추가하는 메소드
	 * @param originalName 기존 파일명
	 * @return 랜덤문자를 추가한 파일명
	 */
	public String getSaveName(String originalName) {
		UUID uuid = UUID.randomUUID();
		String saveName = uuid.toString() + "_" + originalName;
		return saveName;
	}
}
