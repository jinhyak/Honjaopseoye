package hj.controller;

import java.util.HashMap;
import org.apache.log4j.*;
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
	Logger logger = Logger.getLogger(this.getClass());
	@Override
	public Model excute(HttpServletRequest req, HttpServletResponse res, Map<String, String> wMap) throws Exception {
		Logic logic = new Logic(wMap);
		Model view = new Model();
		HashMapBinder hmb = new HashMapBinder(req);
		Map<String, Object> rMap = null;
		String str = null;
		List<Map<String, Object>> list = null;
		Map<String, Object> pMap = new HashMap<String,Object>();
//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 선언  @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
		hmb.bind(pMap);
		if("empty".equals(wMap.get("Logicname"))) {
			rMap = logic.empty(pMap);
			logger.info(rMap);
			if("select".equals(wMap.get("Daoname"))) {
				HttpSession mem_session = req.getSession();
				logger.info(rMap.get("list"));
				list = (List<Map<String,Object>>)rMap.get("list");
				if(list.get(0)!=null) {
				mem_session.setAttribute("memList", rMap.get("list"));
				String path = "../../main/main.jsp";
				view.setPath(path);
				view.setRedirect(true);
				}
				else {
					view.setPath("../../main/main.jsp");
					view.setRedirect(true);
				}
			}
			else if("login".equals(wMap.get("Daoname"))) {
				String result = "";
				result = (String)rMap.get("String");
					if("1".equals(result)) {
						view.setPath("./select.test?mem_id="+pMap.get("mem_id"));
						view.setRedirect(true);
					}
					else if("-1".equals(result)){
						view.setPath("../../member/login/result/result.jsp?result="+result);
						view.setRedirect(true);
					}
					else if("0".equals(result)) {
						view.setPath("../../member/login/result/result.jsp?result="+result);
						view.setRedirect(true);
					}
			}
			else if("check".equals(wMap.get("Daoname"))) {
				logger.info("check 호출 성공");
				String result = "";
				result = rMap.get("check").toString();
					if("1".equals(result)) {
						logger.info(pMap.get("ins_name").toString());
						logger.info(pMap.get("mem_tel").toString());
						String path = "idSearch.test"; //get방식으로 뒤에 붙여서 했더니 글자가 깨져서 redirect -> forward
						view.setRedirect(false); 
						view.setPath(path);
					}else if("-1".equals(result)){
						view.setPath("../../member/login/result/result.jsp?result="+result);
						view.setRedirect(true);
					}else if("0".equals(result)) {
						view.setPath("../../member/login/result/result.jsp?result="+result);
						view.setRedirect(true);
					}
			}
			else if("check2".equals(wMap.get("Daoname"))) {
				String result = "";
				result = rMap.get("check2").toString();
				if("1".equals(result)) {
					logger.info(pMap.get("e_name").toString());
					logger.info(pMap.get("e_mail").toString());
					String path = "e_idSearch.test";
					view.setRedirect(false);
					view.setPath(path);
				}else if("-1".equals(result)){
					view.setPath("../../member/login/result/result.jsp?result="+result);
					view.setRedirect(true);
				}else if("0".equals(result)) {
					view.setPath("../../member/login/result/result.jsp?result="+result);
					view.setRedirect(true);
				}
			}
			else if("idSearch".equals(wMap.get("Daoname"))) {
				HttpSession mem_session = req.getSession();
				mem_session.setAttribute("idSearch", rMap.get("idSearch"));
				String path = "../../member/login/idFound.jsp";
				view.setPath(path);
				view.setRedirect(true);
			}
			else if("e_idSearch".equals(wMap.get("Daoname"))) {
				HttpSession mem_session = req.getSession();
				mem_session.setAttribute("e_idSearch", rMap.get("e_idSearch"));
				String path = "../../member/login/idFound2.jsp";
				view.setPath(path);
				view.setRedirect(true);
			}
			else if("pwCheck".equals(wMap.get("Daoname"))) {
				logger.info("pwCheck 호출 성공");
				String result = "";
				result = rMap.get("pwCheck").toString();
				if("1".equals(result)) {
					logger.info(pMap.get("mem_id").toString());
					logger.info(pMap.get("mem_tel").toString());
					String path = "pwSearch.test";
					view.setRedirect(false);
					view.setPath(path);
				}else if("-1".equals(result)){
					view.setPath("../../member/login/result/result.jsp?result="+result);
					view.setRedirect(true);
				}else if("0".equals(result)) {
					view.setPath("../../member/login/result/result.jsp?result="+result);
					view.setRedirect(true);
				}
			}
			else if("pwSearch".equals(wMap.get("Daoname"))) {
				HttpSession mem_session = req.getSession();
				mem_session.setAttribute("pwSearch", rMap.get("pwSearch"));
				String path = "../../member/login/pwFound.jsp";
				view.setPath(path);
				view.setRedirect(true);
			}
			else if("pwCheck2".equals(wMap.get("Daoname"))) {
				logger.info("pwCheck2 호출 성공");
				String result = "";
				result = rMap.get("pwCheck2").toString();
				if("1".equals(result)) {
					logger.info(pMap.get("e_id").toString());
					logger.info(pMap.get("e_mail").toString());
					String path = "e_pwSearch.test";
					view.setRedirect(false);
					view.setPath(path);
				}else if("-1".equals(result)){
					view.setPath("../../member/login/result/result.jsp?result="+result);
					view.setRedirect(true);
				}else if("0".equals(result)) {
					view.setPath("../../member/login/result/result.jsp?result="+result);
					view.setRedirect(true);
				}
			}
			else if("e_pwSearch".equals(wMap.get("Daoname"))) {
				HttpSession mem_session = req.getSession();
				mem_session.setAttribute("e_pwSearch", rMap.get("e_pwSearch"));
				String path = "../../member/login/pwFound2.jsp";
				view.setPath(path);
				view.setRedirect(true);
			}
			else if("delete".equals(wMap.get("Daoname"))) {
				int result = (int)rMap.get("int");
				if(1==result) {
					view.setPath("../../member/login/logout.jsp");
					view.setRedirect(true);
				}
				else {
					view.setPath("../../member/meminfo/mdelete.jsp");
					view.setRedirect(true);
				}
			}
			else if("update".equals(wMap.get("Daoname"))){
				int result = (int)rMap.get("int");
				view.setPath("../../member/meminfo/result/result.jsp?result="+result);
				view.setRedirect(true);
			}
			else {
				int result= (int)rMap.get("int");
				view.setPath("../../member/join/result/join_result.jsp?result="+result);
				view.setRedirect(true);
			}
		}			
		return view;
	}

}
