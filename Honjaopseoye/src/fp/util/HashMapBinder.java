package fp.util;

import java.io.IOException;
import java.util.Enumeration;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**************************************************
 * 공통 코드를 작성해 봅시다.
 * 1)파라미터가 필요한가? - yes(왜?)
 * 힌트 : 누가 언제 어떤 클래스에서 인스턴스화를 해야 하는거지?
 * 		어떤 시점에 필요한 걸까?
 **************************************************/
public class HashMapBinder {
	//리퀘스트 받을 변수
	HttpServletRequest req = null;
	//생성자
	public HashMapBinder(HttpServletRequest req) {
		this.req = req;
	//서블릿에 리퀘스트 파라미터를 넘겨준다.
	}

	public void bind(Map<String,Object> pMap){//외부에서 객체주입을 받은 변수
		pMap.clear();//NullPointerException이 뜨지 않는다.
		Enumeration<String> en = req.getParameterNames();
		while(en.hasMoreElements()) {						//hasMore로 false(값이 없음)가 뜰때까지 while
			String key = en.nextElement();
			pMap.put(key, HangulConversion.toKor(req.getParameter(key)));
		}
	//
	}
}
