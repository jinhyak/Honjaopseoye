package fp.util;

import java.io.IOException;
import java.util.Enumeration;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**************************************************
 * ���� �ڵ带 �ۼ��� ���ô�.
 * 1)�Ķ���Ͱ� �ʿ��Ѱ�? - yes(��?)
 * ��Ʈ : ���� ���� � Ŭ�������� �ν��Ͻ�ȭ�� �ؾ� �ϴ°���?
 * 		� ������ �ʿ��� �ɱ�?
 **************************************************/
public class HashMapBinder {
	//������Ʈ ���� ����
	HttpServletRequest req = null;
	//������
	public HashMapBinder(HttpServletRequest req) {
		this.req = req;
	//������ ������Ʈ �Ķ���͸� �Ѱ��ش�.
	}

	public void bind(Map<String,Object> pMap){//�ܺο��� ��ü������ ���� ����
		pMap.clear();//NullPointerException�� ���� �ʴ´�.
		Enumeration<String> en = req.getParameterNames();
		while(en.hasMoreElements()) {						//hasMore�� false(���� ����)�� �㶧���� while
			String key = en.nextElement();
			pMap.put(key, HangulConversion.toKor(req.getParameter(key)));
		}
	//
	}
}
