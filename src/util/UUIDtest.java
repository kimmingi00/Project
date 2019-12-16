package util;

import java.util.UUID;

public class UUIDtest {

	public static void main(String[] args) {
		
		for(int i=0; i<5; i++) {
			String uuid = UUID.randomUUID().toString();
			System.out.println(uuid.substring(0,8));
		}
	}

}
