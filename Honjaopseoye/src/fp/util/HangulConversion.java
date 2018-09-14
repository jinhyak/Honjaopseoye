package fp.util;

public class HangulConversion {
	//영문 인코딩 타입으로 읽어서 한글 인코딩 타입으로 전환
	public static String toKor(String en) {
		if(en==null) return null;
		try {
			return new String(en.getBytes("8859_1"),"euc-kr");
		} catch (Exception e) {
			// TODO: handle exception
			return en;
		}	
	}
	//utf-8타입의 경우
	public static String toUTF(String en) {
		if(en==null) return null;
		try {
			return new String(en.getBytes("8859_1"),"utf-8");
		} catch (Exception e) {
			// TODO: handle exception
			return en;
		}
	}
}
