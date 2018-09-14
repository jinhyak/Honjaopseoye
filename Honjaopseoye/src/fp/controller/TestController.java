package fp.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import hj.common.ControllerForm;
import hj.common.HashMapBinder;
import hj.common.Model;
import hj.logic.Logic;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class TestController implements ControllerForm{
	Logger logger = Logger.getLogger(this.getClass());
	@Override
	public Model excute(HttpServletRequest req, HttpServletResponse res, Map<String, String> wMap) throws Exception{
		Logic logic = new Logic(wMap);
		Model view = new Model();
		HashMapBinder hmb = new HashMapBinder(req);
		Map<String, Object> rMap = null;
		String str = null;
		List<Map<String, Object>> list = null;
		Map<String, Object> pMap = new HashMap<String,Object>();
//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 선언  @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
		hmb.bind(pMap);
		
		if("sum".equals(wMap.get("Logicname"))) {
			logger.info("test/sum 성공");
			int result = logic.sum(pMap);
			logger.info("db연동성공");
			req.setAttribute("result", result);
			view.setPath("test.jsp");
			view.setRedirect(false);
		}
		else if("minus".equals(wMap.get("Logicname"))) {
			int result = 0;
			result = logic.avg(pMap);
			req.setAttribute("result", result);
			view.setPath("test.jsp");
			view.setRedirect(false);
		}
		else if("avg".equals(wMap.get("Logicname"))) {
			int result = 0;
			result = logic.avg(pMap);
			req.setAttribute("result", result);
			view.setPath("test.jsp");
			view.setRedirect(false);
		}
		else if("multiple".equals(wMap.get("Logicname"))) {
			int result = 0;
			result = logic.avg(pMap);
			req.setAttribute("result", result);
			view.setPath("test.jsp");
			view.setRedirect(false);
		}
		else if("divide".equals(wMap.get("Logicname"))) {
			int result = 0;
			result = logic.avg(pMap);
			req.setAttribute("result", result);
			view.setPath("test.jsp");
			view.setRedirect(false);
		}
		else if("empty".equals(wMap.get("Logicname"))) {
			int result = 0;
			rMap = logic.empty(pMap);
			req.setAttribute("result", result);
			view.setPath("test.jsp");
			view.setRedirect(false);
		}
		return view;
	}
}
