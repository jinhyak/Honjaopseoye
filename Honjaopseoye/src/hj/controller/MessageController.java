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
			if("insert".equals(map.get("Daoname"))) {
				rMap = logic.empty(pMap);
				int result = (int)rMap.get("int");
				view.setPath("../../member/message/result/result.jsp?result="+result);
				view.setRedirect(true);
			}
			else if("msgListByRecent".equals(map.get("Daoname"))) {
				rMap = logic.empty(pMap);
				list = (List<Map<String,Object>>)rMap.get("list");
				req.setAttribute("result", list);
				view.setPath("../../member/message/result/mlist.jsp");
				view.setRedirect(false);
			}
			else if("allUnReadMsg".equals(map.get("Daoname"))) {
				rMap = logic.empty(pMap);
				str = rMap.get("String").toString();
				view.setPath("../../member/message/result/result.jsp?result="+str);
				view.setRedirect(true);
			}
			else if("getmsgBox".equals(map.get("Daoname"))) {
				rMap = logic.empty(pMap);
				list = (List<Map<String,Object>>)rMap.get("list");
				req.setAttribute("result", list);
				view.setPath("../../member/message/result/blist.jsp");
				view.setRedirect(false);
			}
			else {
				view.setPath("../test/error.jsp");
			}
		}

		return view;
	}

}
