package hj.logic;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;

import hj.dao.BoardDao;
import hj.dao.FriendDao;
import hj.dao.GubunDao;
import hj.dao.HotPlaceDao;
import hj.dao.MemberDao;
import hj.dao.MessageDao;
import hj.dao.ReplyDao;
import hj.dao.StoreDao;
import hj.dao.TestDao;

public abstract class AbstractLogic {
	Logger logger = Logger.getLogger(AbstractLogic.class);
	TestDao tdao = new TestDao();
	BoardDao bdao = new BoardDao();
	MessageDao messagedao = new MessageDao();
	ReplyDao rdao = new ReplyDao();
	GubunDao gdao = new GubunDao();
	MemberDao mdao = new MemberDao();
	FriendDao fdao = new FriendDao();
	StoreDao sdao = new StoreDao();
	HotPlaceDao hdao = new HotPlaceDao();
	List<Map<String, Object>> list = null;
	Map<String, String> wMap = null;
	Map<String, Object> rMap = new HashMap<String,Object>();
	String Daoname = null;
	String str = null;
	int result = 0;
	public Map<String,Object> testLogic(Map<String, Object> pMap) throws Exception {
		rMap.clear();
		if("insert".equals(Daoname)) {
			result = tdao.insert(pMap);
			rMap.put("int", result);
		}
		else if("select".equals(Daoname)) {
			list = tdao.select(pMap);
			rMap.put("list", list);
		}
		else if("update".equals(Daoname)) {
			result = tdao.update(pMap);
			rMap.put("int", result);
		}
		else if("delete".equals(Daoname)) {
			result = tdao.delete(pMap);
			rMap.put("int", result);
		}
		else {
			logger.info("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ DAO클래스 호출 실패 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
			return null;
		}
		return rMap;
	}
	public Map<String, Object> messageLogic(Map<String, Object> pMap) throws Exception {
		
		if("insert".equals(Daoname)) {
			result = messagedao.insert(pMap);
			rMap.put("int", result);
		}
		else if("msgListByRecent".equals(Daoname)) {
			list = messagedao.msgListByRecent(pMap);
			rMap.put("list", list);
		}
		else if("delete".equals(Daoname)) {
			result = messagedao.delete(pMap);
			rMap.put("int", result);
		}
		else if("allUnReadMsg".equals(Daoname)) {
			String result = null;
			result = messagedao.allUnReadMsg(pMap);
			rMap.put("String", result);
		}
		else if("getmsgBox".equals(Daoname)) {
			list = messagedao.getmsgBox(pMap);
			rMap.put("list", list);
		}
		else if("unReadMsg".equals(Daoname)) {
			String result = null;
			result = messagedao.unReadMsg(pMap);
			rMap.put("String", result);
		}
		else {
			logger.info("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ DAO클래스 호출 실패 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
			logger.info("rMap null로 리턴");
			return null;
		}
		return rMap;
	}
	public Map<String, Object> boardLogic(Map<String, Object> pMap) throws Exception {
		
		if("insert".equals(Daoname)) {
			result = bdao.insert(pMap);
			rMap.put("int", result);
		}
		else if("select".equals(Daoname)) {
			list = bdao.select(pMap);
			rMap.put("list", list);
		}
		else if("update".equals(Daoname)) {
			result = bdao.update(pMap);
			rMap.put("int", result);
		}
		else if("delete".equals(Daoname)) {
			result = bdao.delete(pMap);
			rMap.put("int", result);
		}
		else {
			logger.info("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ DAO클래스 호출 실패 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
			return null;
		}
		return rMap;
	}
	public Map<String, Object> replyLogic(Map<String, Object> pMap) throws Exception {
		
		if("insert".equals(Daoname)) {
			result = rdao.insert(pMap);
			rMap.put("result", result);
		}
		else if("select".equals(Daoname)) {
			list = rdao.select(pMap);
			rMap.put("list", list);
		}
		else if("update".equals(Daoname)) {
			result = rdao.update(pMap);
			rMap.put("result", result);
		}
		else if("delete".equals(Daoname)) {
			result = rdao.delete(pMap);
			rMap.put("result", result);
		}
		else {
			logger.info("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ DAO클래스 호출 실패 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
			rMap = null;
		}
		return rMap;
	}
	private Map<String, Object> gubunLogic(Map<String, Object> pMap) throws IOException {
		Logger logger = Logger.getLogger(this.getClass());
		if("insert".equals(Daoname)) {
			result = gdao.insert(pMap);
			rMap.put("result", result);
		}
		else if("doselect".equals(Daoname)) {
			list = gdao.doselect(pMap);
			rMap.put("list", list);
		}
		else if("siselect".equals(Daoname)) {
			logger.info("sislect호출 성공");
			list = gdao.siselect(pMap);
			rMap.put("list", list);
		}
		else if("dongselect".equals(Daoname)) {
			list = gdao.dongselect(pMap);
			rMap.put("list", list);
		}
		else if("detailselect".equals(Daoname)) {
			list = gdao.detailselect(pMap);
			rMap.put("list", list);
		}
		else {
			logger.info("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ DAO클래스 호출 실패 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
			rMap = null;
		}
		return rMap;
	}
	private Map<String, Object> memberLogic(Map<String, Object> pMap) throws IOException {
		Logger logger = Logger.getLogger(this.getClass());
		if("insert".equals(Daoname)) {
			result = mdao.insert(pMap);
			rMap.put("int", result);
		}
		else if("tel_sel".equals(Daoname)) {
			logger.info("ID호출 성공");
			result = mdao.tel_sel(pMap);
			rMap.put("int", result);
		}
		else if("id_sel".equals(Daoname)) {
			logger.info("ID호출 성공");
			result = mdao.id_sel(pMap);
			rMap.put("int", result);
		} 
		else if ("select".equals(Daoname)) {
		logger.info("AbLogic : select 메소드 실행 성공");
		list = mdao.select(pMap);
		rMap.put("list", list);
		}
		else if ("login".equals(Daoname)) {
		logger.info("AbLogic : login 메소드 실행 성공");
		String result = mdao.login(pMap);
		rMap.put("String", result);
		}
		else if("delete".equals(Daoname)) {
			int result= mdao.delete(pMap);
			rMap.put("int", result);
		}
		else if("update".equals(Daoname)) {
			int result = mdao.update(pMap);
			rMap.put("int", result);
		}
		else if("check".equals(Daoname)) {
			logger.info("AbLogic : check 호출 성공");
			String result = mdao.check(pMap);
			rMap.put("check", result);
		}else if("check2".equals(Daoname)) {
			logger.info("AbLogic : check2 호출 성공");
			String result = mdao.check2(pMap);
			rMap.put("check2", result);
		}
		else if("idSearch".equals(Daoname)) {
	         list = mdao.idSearch(pMap);
	         rMap.put("idSearch", list);
	    }
	    else if("e_idSearch".equals(Daoname)) {
	    	logger.info("e_idSearch 호출 성공");
	         list = mdao.e_idSearch(pMap);
	         rMap.put("e_idSearch", list);
	    }
	    else if("pwCheck".equals(Daoname)) {
	    	logger.info("AbLogic : pwCheck 호출 성공");
	    	String result = mdao.pwCheck(pMap);
	    	rMap.put("pwCheck", result);
	    }
	    else if("pwSearch".equals(Daoname)) {
	    	logger.info("AbLogic : pwSearch 호출 성공");
	    	list = mdao.pwSearch(pMap);
	    	rMap.put("pwSearch", list);
	    }
	    else if("pwCheck2".equals(Daoname)) {
	    	logger.info("AbLogic : pwCheck2 호출 성공");
	    	String result = mdao.pwCheck2(pMap);
	    	rMap.put("pwCheck2", result);
	    }
	    else if("e_pwSearch".equals(Daoname)) {
	    	logger.info("AbLogic : e_pwSearch 호출 성공");
	    	list = mdao.e_pwSearch(pMap);
	    	rMap.put("e_pwSearch", list);
	    }
		else {
			logger.info("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ DAO클래스 호출 실패 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
			rMap = null;
		}
		return rMap;
	}
	private Map<String, Object> friendLogic(Map<String, Object> pMap) throws IOException {
		Logger logger = Logger.getLogger(this.getClass());
		if("insert".equals(Daoname)) {
			result = fdao.insert(pMap);
			rMap.put("int", result);
		}
		else if("fri_select".equals(Daoname)) {
			logger.info("친구검색호출 성공");
			list = fdao.fri_select(pMap);
			rMap.put("list", list);
		}
		else if ("select".equals(Daoname)) {
			logger.info("AbLogic : select 메소드 실행 성공");
			list = fdao.select(pMap);
			rMap.put("list", list);
		}
		else if("delete".equals(Daoname)) {
			int result= fdao.delete(pMap);
			rMap.put("int", result);
		}
		else if("update".equals(Daoname)) {
			int result = fdao.update(pMap);
			rMap.put("int", result);
		}
		else {
			logger.info("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ DAO클래스 호출 실패 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
			rMap = null;
		}
		return rMap;
	}
	public Map<String,Object> gethotPlace(Map<String,Object> pMap) throws Exception{
		
		if("select".equals(Daoname)) {
			logger.info("getHotPlace호출");
			list = hdao.select(pMap);
			rMap.put("list", list);
		}
		else {
			logger.info("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ DAO클래스 호출 실패 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
			return null;
		}
		return rMap;
	}
	public int storeAdd(Map<String,Object> pMap) throws Exception{
		
		if("matjip".equals(Daoname)) {
			logger.info("storeAdd호출");
			result = sdao.insert(pMap); 
		}
		else {
			logger.info("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ DAO클래스 호출 실패 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
			return 0;
		}
		
		return result;
	}
//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ empty호출시 dao로 바로 분기 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@//
		public Map<String, Object> empty(Map<String, Object> pMap) throws Exception {
			logger.info("empty메소드 호출성공");
			if("board".equals(wMap.get("Ctrname"))) {
				rMap = boardLogic(pMap);
			}
			else if("message".equals(wMap.get("Ctrname"))) {
				rMap = messageLogic(pMap);
			}
			else if("reply".equals(wMap.get("Ctrname"))) {
				rMap = replyLogic(pMap);
			}
			else if("test".equals(wMap.get("Ctrname"))) {
				rMap = testLogic(pMap);
			}
			else if("gubun".equals(wMap.get("Ctrname"))){
				rMap = gubunLogic(pMap);
				logger.info("gubunLogic 호출성공");
			}
			else if("member".equals(wMap.get("Ctrname"))) {
				rMap = memberLogic(pMap);
			}
			else if("friend".equals(wMap.get("Ctrname"))) {
				rMap = friendLogic(pMap);
			}
			else {
				logger.info("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 해당컨트롤러에 대한 다오가 존재하지 않습니다. 추가바랍니다 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
			}
			return rMap;
		}
}