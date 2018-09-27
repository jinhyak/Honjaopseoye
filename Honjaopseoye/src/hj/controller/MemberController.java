package hj.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;

import hj.common.ControllerForm;
import hj.common.HangulConversion;
import hj.common.HashMapBinder;
import hj.common.Model;
import hj.logic.Logic;

public class MemberController implements ControllerForm{
	Logger logger = Logger.getLogger(MemberController.class);
	@Override
	public Model excute(HttpServletRequest req, HttpServletResponse res, Map<String, String> map) throws Exception {
		logger.info("excute 호출");
		Logic logic = new Logic(map);
		Model view = new Model();
		HangulConversion hg = new HangulConversion();
		Map<String, Object> rMap = null;
		String str = null;
		List<Map<String, Object>> list = null;
		Map<String, Object> pMap = new HashMap<String,Object>();
		HashMapBinder hmb = new HashMapBinder(req);
//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 선언  @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
		hmb.bind(pMap);
		if("empty".equals(map.get("Logicname"))) {
			if(pMap.get("ins_name")!=null) {
				String ins_name = hg.toUTF(pMap.get("ins_name").toString());
				pMap.put("ins_name", ins_name);
				logger.info("Controller : "+pMap);
				rMap = logic.empty(pMap);
			}else {
				logger.info("Controller : "+pMap);
				rMap = logic.empty(pMap);
			}
			
			if("select".equals(map.get("Daoname"))) {
				HttpSession mem_session = req.getSession();
				mem_session.setAttribute("memList", rMap.get("list"));
				String path = "../../main/main.jsp";
				view.setPath(path);
			}else if("idSearch".equals(map.get("Daoname"))) {
				HttpSession mem_session = req.getSession();
				mem_session.setAttribute("idSearch", rMap.get("idSearch"));
				String path = "../../member/login/result/idFound.jsp";
				view.setPath(path);
			}else if("e_idSearch".equals(map.get("Daoname"))) {
				HttpSession mem_session = req.getSession();
				mem_session.setAttribute("e_idSearch", rMap.get("e_idSearch"));
				String path = "../../member/login/result/idFound2.jsp";
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
