package hj.logic;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;

import hj.dao.BoardDao;
import hj.dao.FriendDao;
import hj.dao.GubunDao;
import hj.dao.MemberDao;
import hj.dao.MessageDao;
import hj.dao.ReplyDao;
import hj.dao.TestDao;
import hj.dao.GubunDao;

public abstract class AbstractLogic {
<<<<<<< HEAD
	Logger logger = Logger.getLogger(AbstractLogic.class);
	TestDao tdao = new TestDao();
	BoardDao bdao = new BoardDao();
	MessageDao messagedao = new MessageDao();
	ReplyDao rdao = new ReplyDao();
	GubunDao gdao = new GubunDao();
	MemberDao mdao = new MemberDao();
	FriendDao fdao = new FriendDao();
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
			logger.info("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ DAO≈¨∑°Ω∫ »£√‚ Ω«∆– @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
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
			logger.info("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ DAO≈¨∑°Ω∫ »£√‚ Ω«∆– @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
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
			logger.info("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ DAO≈¨∑°Ω∫ »£√‚ Ω«∆– @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
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
			logger.info("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ DAO≈¨∑°Ω∫ »£√‚ Ω«∆– @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
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
			logger.info("sislect»£√‚ º∫∞¯");
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
			logger.info("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ DAO≈¨∑°Ω∫ »£√‚ Ω«∆– @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
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
			logger.info("ID»£√‚ º∫∞¯");
			result = mdao.tel_sel(pMap);
			rMap.put("int", result);
		}
		else if("id_sel".equals(Daoname)) {
			logger.info("ID»£√‚ º∫∞¯");
			result = mdao.id_sel(pMap);
			rMap.put("int", result);
		} 
		else if ("select".equals(Daoname)) {
		logger.info("AbLogic : select ∏ﬁº“µÂ Ω««‡ º∫∞¯");
		list = mdao.select(pMap);
		rMap.put("list", list);
		}
		else if ("login".equals(Daoname)) {
		logger.info("AbLogic : login ∏ﬁº“µÂ Ω««‡ º∫∞¯");
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
		else {
			logger.info("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ DAO≈¨∑°Ω∫ »£√‚ Ω«∆– @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
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
			logger.info("ƒ£±∏∞Àªˆ»£√‚ º∫∞¯");
			list = fdao.fri_select(pMap);
			rMap.put("list", list);
		}
		else if ("select".equals(Daoname)) {
			logger.info("AbLogic : select ∏ﬁº“µÂ Ω««‡ º∫∞¯");
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
			logger.info("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ DAO≈¨∑°Ω∫ »£√‚ Ω«∆– @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
			rMap = null;
		}
		return rMap;
	}
=======
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
         logger.info("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ DAO≈¨∑°Ω∫ »£√‚ Ω«∆– @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
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
         logger.info("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ DAO≈¨∑°Ω∫ »£√‚ Ω«∆– @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
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
         logger.info("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ DAO≈¨∑°Ω∫ »£√‚ Ω«∆– @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
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
         logger.info("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ DAO≈¨∑°Ω∫ »£√‚ Ω«∆– @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
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
         logger.info("sislect»£√‚ º∫∞¯");
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
         logger.info("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ DAO≈¨∑°Ω∫ »£√‚ Ω«∆– @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
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
         logger.info("ID»£√‚ º∫∞¯");
         result = mdao.tel_sel(pMap);
         rMap.put("int", result);
      }
      else if("id_sel".equals(Daoname)) {
         logger.info("ID»£√‚ º∫∞¯");
         result = mdao.id_sel(pMap);
         rMap.put("int", result);
      } 
      else if ("select".equals(Daoname)) {
      logger.info("AbLogic : select ∏ﬁº“µÂ Ω««‡ º∫∞¯");
      list = mdao.select(pMap);
      rMap.put("list", list);
      }
      else if("delete".equals(Daoname)) {
         int result= mdao.delete(pMap);
         rMap.put("int", result);
      }
      else if("idSearch".equals(Daoname)) {
         list = mdao.idSearch(pMap);
         rMap.put("idSearch", list);
      }
      else if("e_idSearch".equals(Daoname)) {
         list = mdao.e_idSearch(pMap);
         rMap.put("e_idSearch", list);
      }
      else {
         logger.info("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ DAO≈¨∑°Ω∫ »£√‚ Ω«∆– @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
         rMap = null;
      }
      return rMap;
   }
>>>>>>> refs/remotes/origin/Ìù¨ÏßÑ

//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ empty»£√‚Ω√ dao∑Œ πŸ∑Œ ∫–±‚ @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@//
<<<<<<< HEAD
		public Map<String, Object> empty(Map<String, Object> pMap) throws Exception {
			logger.info("empty∏ﬁº“µÂ »£√‚º∫∞¯");
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
				logger.info("gubunLogic »£√‚º∫∞¯");
			}
			else if("member".equals(wMap.get("Ctrname"))) {
				rMap = memberLogic(pMap);
			}
			else if("friend".equals(wMap.get("Ctrname"))) {
				rMap = friendLogic(pMap);
			}
			else {
				logger.info("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ «ÿ¥Áƒ¡∆Æ∑—∑Øø° ¥Î«— ¥Ÿø¿∞° ¡∏¿Á«œ¡ˆ æ Ω¿¥œ¥Ÿ. √ﬂ∞°πŸ∂¯¥œ¥Ÿ @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
			}
			return rMap;
		}
=======
      public Map<String, Object> empty(Map<String, Object> pMap) throws Exception {
         logger.info("empty∏ﬁº“µÂ »£√‚º∫∞¯");
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
            logger.info("gubunLogic »£√‚º∫∞¯");
         }
         else if("member".equals(wMap.get("Ctrname"))) {
            rMap = memberLogic(pMap);
            logger.info("member »£√‚ º∫∞¯");
         }
         else {
            logger.info("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ «ÿ¥Áƒ¡∆Æ∑—∑Øø° ¥Î«— ¥Ÿø¿∞° ¡∏¿Á«œ¡ˆ æ Ω¿¥œ¥Ÿ. √ﬂ∞°πŸ∂¯¥œ¥Ÿ @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
         }
         return rMap;
      }
>>>>>>> refs/remotes/origin/Ìù¨ÏßÑ
}