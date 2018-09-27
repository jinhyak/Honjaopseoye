package hj.common;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.util.Map;

public interface ControllerForm {
	
	public Model excute(HttpServletRequest req,HttpServletResponse res, Map<String, String> wMap) throws Exception;
	
}
