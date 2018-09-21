package hj.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import hj.common.ControllerForm;
import hj.common.HashMapBinder;
import hj.common.Model;
import hj.logic.Logic;

public class MemberController implements ControllerForm{

	@Override
	public Model excute(HttpServletRequest req, HttpServletResponse res, Map<String, String> map) throws Exception {
		Logic logic = new Logic(map);
		Model view = new Model();
		HashMapBinder hmb = new HashMapBinder(req);
		Map<String, Object> rMap = null;
		String str = null;
		List<Map<String, Object>> list = null;
		Map<String, Object> pMap = new HashMap<String,Object>();
//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ ����  @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
		hmb.bind(pMap);
		if("empty".equals(map.get("Logicname"))) {
			rMap = logic.empty(pMap);
			
			if("select".equals(map.get("Daoname"))) {
				HttpSession mem_session = req.getSession();
				mem_session.setAttribute("memList", rMap.get("list"));
				String path = "../../main/main.jsp";
				view.setPath(path);
			}
			else if("delete".equals(map.get("Daoname"))) {
				int result = (int)rMap.get("int");
				if(1==result) {
					view.setPath("../../main/main.jsp");
				}
				else {
					view.setPath("../../member/meminfo/mdelete.jsp");
				}
			}
			else {
				int result= (int)rMap.get("int");
				view.setPath("../../member/join/result/join_result.jsp?result="+result);
			}
		}			

		view.setRedirect(true);
		return view;
	}

}