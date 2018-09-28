package hj.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import hj.common.ControllerForm;
import hj.common.HashMapBinder;
import hj.common.Model;
import hj.logic.Logic;

public class MessageController implements ControllerForm{
	Logger logger = Logger.getLogger(this.getClass());
	@Override
	public Model excute(HttpServletRequest req, HttpServletResponse res, Map<String, String> map) throws Exception {
		Logic logic = new Logic(map);
		Model view = new Model();
		HashMapBinder hmb = new HashMapBinder(req);
		Map<String, Object> rMap = null;
		List<Map<String, Object>> list = null;
		String str = null;
		Map<String, Object> pMap = new HashMap<String,Object>();
		hmb.bind(pMap);
//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 선언  @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
		if("empty".equals(map.get("Logicname"))) {
			logger.info("messageController 진입완료");
			rMap = logic.empty(pMap);
			if("insert".equals(map.get("Daoname"))) {
				int result = (int)rMap.get("int");
				view.setPath("../../member/message/result/result.jsp?result="+result);
				view.setRedirect(true);
			}
			else {
				view.setPath("../../member/join/result/result.jsp");
			}
		}
		return view;
	}

}
