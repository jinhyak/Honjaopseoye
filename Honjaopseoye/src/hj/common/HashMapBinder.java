package hj.common;

import java.util.Enumeration;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;

public class HashMapBinder {
	Logger logger = Logger.getLogger(HashMapBinder.class);
	HttpServletRequest req = null;
	public HashMapBinder(HttpServletRequest req){
		this.req = req;
	}
	public void bind(Map<String,Object> pMap) {//공통코드
		pMap.clear();
		Enumeration<String> en =req.getParameterNames();
		while(en.hasMoreElements()) {
			String key = en.nextElement();
			logger.info(req.getParameter(key));
			pMap.put(key, req.getParameter(key));
		}
	}
}
