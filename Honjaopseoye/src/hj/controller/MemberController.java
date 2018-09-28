package hj.controller;

import java.util.HashMap;
import org.apache.log4j.*;
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
<<<<<<< HEAD
	Logger logger = Logger.getLogger(this.getClass());
=======
	Logger logger = Logger.getLogger(MemberController.class);
>>>>>>> refs/remotes/origin/Ìù¨ÏßÑ
	@Override
<<<<<<< HEAD
	public Model excute(HttpServletRequest req, HttpServletResponse res, Map<String, String> wMap) throws Exception {
		Logic logic = new Logic(wMap);
=======
	public Model excute(HttpServletRequest req, HttpServletResponse res, Map<String, String> map) throws Exception {
		logger.info("excute »£√‚");
		Logic logic = new Logic(map);
>>>>>>> refs/remotes/origin/Ìù¨ÏßÑ
		Model view = new Model();
		HangulConversion hg = new HangulConversion();
		Map<String, Object> rMap = null;
		String str = null;
		List<Map<String, Object>> list = null;
		Map<String, Object> pMap = new HashMap<String,Object>();
		HashMapBinder hmb = new HashMapBinder(req);
//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ º±æ  @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
		hmb.bind(pMap);
<<<<<<< HEAD
		if("empty".equals(wMap.get("Logicname"))) {
			rMap = logic.empty(pMap);
			logger.info(rMap);
			if("select".equals(wMap.get("Daoname"))) {
=======
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
>>>>>>> refs/remotes/origin/Ìù¨ÏßÑ
				HttpSession mem_session = req.getSession();
				logger.info(rMap.get("list"));
				list = (List<Map<String,Object>>)rMap.get("list");
				if(list.get(0)!=null) {
				mem_session.setAttribute("memList", rMap.get("list"));
				String path = "../../main/main.jsp";
				view.setPath(path);
<<<<<<< HEAD
				}
				else {
					view.setPath("../../main/main.jsp");
				}
=======
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
>>>>>>> refs/remotes/origin/Ìù¨ÏßÑ
			}
			else if("login".equals(wMap.get("Daoname"))) {
				String result = "";
				result = (String)rMap.get("String");
					if("1".equals(result)) {
						view.setPath("./select.test?mem_id="+pMap.get("mem_id"));
					}
					else if("-1".equals(result)){
						view.setPath("../../member/login/result/result.jsp?result="+result);
					}
					else if("0".equals(result)) {
						view.setPath("../../member/login/result/result.jsp?result="+result);
					}
			}
			else if("delete".equals(wMap.get("Daoname"))) {
				int result = (int)rMap.get("int");
				if(1==result) {
					view.setPath("../../member/login/logout.jsp");
				}
				else {
					view.setPath("../../member/meminfo/mdelete.jsp");
				}
			}
			else if("update".equals(wMap.get("Daoname"))){
				int result = (int)rMap.get("int");
				view.setPath("../../member/meminfo/result/result.jsp?result="+result);
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
