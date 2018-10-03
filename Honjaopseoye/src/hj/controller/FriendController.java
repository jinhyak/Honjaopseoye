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

public class FriendController implements ControllerForm{
	Logger logger = Logger.getLogger(this.getClass());
	@Override
	public Model excute(HttpServletRequest req, HttpServletResponse res, Map<String, String> wMap) throws Exception {
		Logic logic = new Logic(wMap);
		Model view = new Model();
		HashMapBinder hmb = new HashMapBinder(req);
		Map<String, Object> rMap = null;
		List<Map<String, Object>> list = null;
		Map<String, Object> pMap = new HashMap<String,Object>();
//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ ¼±¾ð  @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
		hmb.bind(pMap);
		
		if("sum".equals(wMap.get("Logicname"))) {
		}
		else if("minus".equals(wMap.get("Logicname"))) {
		}
		else if("avg".equals(wMap.get("Logicname"))) {
		}
		else if("multiple".equals(wMap.get("Logicname"))) {
		}
		else if("divide".equals(wMap.get("Logicname"))) {
		}
		else if("empty".equals(wMap.get("Logicname"))) {
			rMap = logic.empty(pMap);
			if("fri_select".equals(wMap.get("Daoname"))) {
				list = (List<Map<String, Object>>)rMap.get("list");
				req.setAttribute("result", list);
				view.setPath("../../member/meminfo/result/fri_search.jsp");
				view.setRedirect(false);
			}
			else if("insert".equals(wMap.get("Daoname"))) {
				int result = 0;
				result = (int)rMap.get("int");
				view.setPath("../../member/meminfo/result/result.jsp?result="+result);
				view.setRedirect(true);
			}
			else if("select".equals(wMap.get("Daoname"))) {
				list = (List<Map<String, Object>>)rMap.get("list");
				req.setAttribute("result", list);
				view.setPath("../../member/meminfo/result/fri_select.jsp");
				view.setRedirect(false);
			}
			else if("delete".equals(wMap.get("Daoname"))) {
				int result = 0;
				result = (int)rMap.get("int");
				view.setPath("../../member/meminfo/result/result.jsp?result="+result);
				view.setRedirect(true);
			}
		}
		return view;
	}

}
