package fp.util;

public class HangulConversion {
	//���� ���ڵ� Ÿ������ �о �ѱ� ���ڵ� Ÿ������ ��ȯ
	public static String toKor(String en) {
		if(en==null) return null;
		try {
			return new String(en.getBytes("8859_1"),"euc-kr");
		} catch (Exception e) {
			// TODO: handle exception
			return en;
		}	
	}
	//utf-8Ÿ���� ���
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
