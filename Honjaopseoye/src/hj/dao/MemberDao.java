package hj.dao;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.log4j.Logger;

import hj.common.DaoForm;
import hj.common.DbMgr;

public class MemberDao implements DaoForm{
	Logger logger = Logger.getLogger(TestDao.class);
	DbMgr dbmgr = new DbMgr();
	SqlSession sqls = null;
	

	public int id_sel(Map<String, Object> pMap) throws IOException {
		List<Map<String, Object>> list = null;
		sqls = dbmgr.connection();
		int result=0;
		result = (int)sqls.selectOne("id_sel", pMap);
		sqls.commit();
		sqls.close();
		return result;
	}
	public int tel_sel(Map<String, Object> pMap) throws IOException {
		List<Map<String, Object>> list = null;
		int result = 0;
		sqls = dbmgr.connection();
		result = (int)sqls.selectOne("tel_sel", pMap);
		sqls.commit();
		sqls.close();
		return result;
	}
	@Override
	public int insert(Map<String, Object> pMap) throws IOException {
		int result = 0;
		sqls = dbmgr.connection();
		result = sqls.insert("join", pMap);
		result = sqls.insert("grade", pMap);
		sqls.commit();
		sqls.close();
		logger.info(result);
		return result;
	}

	@Override
	public int update(Map<String, Object> pMap) throws IOException {
		int result = 0;
		sqls = dbmgr.connection();
		result = sqls.delete("membermap.update", pMap);
		sqls.commit();
		logger.info("result : "+result);
		sqls.close();
		return result;
	}

	@Override
	public int delete(Map<String, Object> pMap) throws IOException {
		logger.info("delete 호출 성공");
		int result = 0;
		sqls = dbmgr.connection();
		result = sqls.delete("delete", pMap);
		sqls.commit();
		logger.info("result : "+result);
		sqls.close();
		return result;
	}
	@Override
	public List<Map<String, Object>> select(Map<String, Object> pMap) throws IOException {
		logger.info(pMap);
		logger.info("mdao : select 메소드 호출 성공");
		List<Map<String, Object>> memberList = null;
		sqls = dbmgr.connection();
		memberList = sqls.selectList("membermap.select", pMap);
		sqls.close();
		return memberList;
	}
	public String login(Map<String, Object> pMap) throws IOException {
		String result ="";
		logger.info(pMap);
		logger.info("mdao : login 메소드 호출 성공");
		sqls = dbmgr.connection();
		result = sqls.selectOne("membermap.login", pMap);
		logger.info(result);
		sqls.close();
		
		return result;
	}
	public String check(Map<String, Object> pMap) throws IOException {
		String result ="";
		logger.info("check"+pMap);
		logger.info("mdao : check 메소드 호출 성공");
		sqls = dbmgr.connection();
		result = sqls.selectOne("membermap.check", pMap);
		logger.info("result는"+result);
		sqls.close();
		
		return result;
	}
	public String check2(Map<String, Object> pMap) throws IOException {
		String result ="";
		logger.info("check2"+pMap);
		logger.info("mdao : check 메소드 호출 성공");
		sqls = dbmgr.connection();
		result = sqls.selectOne("membermap.check2", pMap);
		logger.info("result는"+result);
		sqls.close();
		
		return result;
	}

	 public List<Map<String, Object>> idSearch(Map<String, Object> pMap) throws IOException {
	      logger.info("idSearch:"+pMap);
	      logger.info(pMap.get("ins_name"));
	      logger.info(pMap.get("mem_tel"));
	      List<Map<String, Object>> idSearch = null;
	      sqls = dbmgr.connection();
	      idSearch = sqls.selectList("idSearch", pMap);
	      //String user_pw = idSearch.get(0).get("mem_pw").toString();
	      logger.info("idSearch : "+idSearch);
	      return idSearch;
	   }
	   public List<Map<String, Object>> e_idSearch(Map<String, Object> pMap) throws IOException {
	      logger.info("e_idSearch:"+pMap);
	      List<Map<String, Object>> e_idSearch = null;
	      logger.info(pMap.get("e_name"));
	      logger.info(pMap.get("e_mail"));
	      sqls = dbmgr.connection();
	      e_idSearch = sqls.selectList("e_idSearch", pMap);
	      logger.info("e_idSearch : "+e_idSearch);
	      return e_idSearch;
	   }
	   public String pwCheck(Map<String, Object> pMap) throws IOException {
		   String result ="";
		   logger.info("pwCheck"+pMap);
		   logger.info("mdao : pwCheck 메소드 호출 성공");
		   sqls = dbmgr.connection();
		   result = sqls.selectOne("membermap.pwCheck", pMap);
		   logger.info("result는"+result);
		   sqls.close();
		   
		   return result;
	   }
	   public String pwCheck2(Map<String, Object> pMap) throws IOException {
		   String result ="";
		   logger.info("pwCheck2"+pMap);
		   logger.info("mdao : pwCheck2 메소드 호출 성공");
		   sqls = dbmgr.connection();
		   result = sqls.selectOne("membermap.pwCheck2", pMap);
		   logger.info("result는"+result);
		   sqls.close();
		   
		   return result;
	   }
		   
		   public String proc_pw3(Map<String, Object> pMap) throws IOException {
			      logger.info("proc_pw3:"+pMap);
			      String res = "";
			      logger.info(pMap.get("mem_id").toString());
			      logger.info(pMap.get("mem_tel").toString());
			      sqls = dbmgr.connection();
			      sqls.selectOne("proc_pw", pMap);
			      res = pMap.get("res").toString();
			      logger.info("proc_pw : "+res);
			      return res;
			   }
		   public String proc_epw(Map<String, Object> pMap) throws IOException {
			   logger.info("proc_pw3:"+pMap);
			   String res = "";
			   logger.info(pMap.get("e_id").toString());
			   logger.info(pMap.get("e_mail").toString());
			   sqls = dbmgr.connection();
			   sqls.selectOne("proc_epw", pMap);
			   res = pMap.get("res").toString(); 
			   logger.info("proc_pw : "+res);
			   return res;
		   }
		   
}
