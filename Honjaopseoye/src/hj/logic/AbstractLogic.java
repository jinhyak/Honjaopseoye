package hj.logic;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;

import hj.dao.BoardDao;
import hj.dao.GubunDao;
import hj.dao.MemberDao;
import hj.dao.MessageDao;
import hj.dao.ReplyDao;
import hj.dao.TestDao;
import hj.dao.GubunDao;

public abstract class AbstractLogic {
	Logger logger = Logger.getLogger(AbstractLogic.class);
	TestDao tdao = new TestDao();
	BoardDao bdao = new BoardDao();
	MessageDao messagedao = new MessageDao();
	ReplyDao rdao = new ReplyDao();
	GubunDao gdao = new GubunDao();
	MemberDao mdao = new MemberDao();
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
		else if("select".equals(Daoname)) {
			list = messagedao.select(pMap);
			rMap.put("list", list);
		}
		else if("update".equals(Daoname)) {
			result = messagedao.update(pMap);
			rMap.put("int", result);
		}
		else if("delete".equals(Daoname)) {
			result = messagedao.delete(pMap);
			rMap.put("int", result);
		}
		else {
			logger.info("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ DAO클래스 호출 실패 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
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
		else if("delete".equals(Daoname)) {
			int result= mdao.delete(pMap);
			rMap.put("int", result);
		}
		else {
			logger.info("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ DAO클래스 호출 실패 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
			rMap = null;
		}
		return rMap;
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
			else {
				logger.info("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 해당컨트롤러에 대한 다오가 존재하지 않습니다. 추가바랍니다 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
			}
			return rMap;
		}
}