package hj.dao;

import java.io.IOException;
import java.util.HashMap;
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
      sqls.commit();
      sqls.close();
      logger.info(result);
      return result;
   }

   @Override
   public int update(Map<String, Object> pMap) throws IOException {
      // TODO Auto-generated method stub
      return 0;
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
   public List<Map<String, Object>> idSearch(Map<String, Object> pMap) throws IOException {
      logger.info("idSearch:"+pMap);
      List<Map<String, Object>> idSearch = null;
      sqls = dbmgr.connection();
      idSearch = sqls.selectList("idSearch", pMap);
      logger.info("idSearch : "+idSearch);
      return idSearch;
   }
   public List<Map<String, Object>> e_idSearch(Map<String, Object> pMap) throws IOException {
      logger.info("e_idSearch:"+pMap);
      List<Map<String, Object>> e_idSearch = null;
      sqls = dbmgr.connection();
      e_idSearch = sqls.selectList("e_idSearch", pMap);
      logger.info("e_idSearch : "+e_idSearch);
      return e_idSearch;
   }

}