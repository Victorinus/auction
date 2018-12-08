package auction.encrypt;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import org.springframework.stereotype.Service;

@Service("encryptService")
public class SHA256Service implements EncryptService {

	@Override
	public String encrypt(String origin) throws NoSuchAlgorithmException {
		
		MessageDigest digest = MessageDigest.getInstance("SHA-256");
		digest.update(origin.getBytes(/*MS949*/));
		byte[] data = digest.digest();
		
		StringBuffer buffer = new StringBuffer();
		for(int i=0; i < data.length; i++) {
			int value = (data[i] & 0xff) + 0x100;
			buffer.append(Integer.toString(value, 16).substring(1));
		}
		
		return buffer.toString().toUpperCase();
	}

}
