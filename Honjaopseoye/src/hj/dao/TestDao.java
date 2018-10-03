package hj.dao;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.log4j.Logger;

import hj.common.DbMgr;

public class TestDao {
	Logger logger = Logger.getLogger(TestDao.class);
	DbMgr dbmgr = new DbMgr();
	SqlSession sqls = null;
	
	
	public int insert(Map<String,Object> pMap) throws IOException {
		
		int result = 0;
		sqls = dbmgr.connection();
		result = sqls.insert("insert", pMap);
		sqls.close();
		
		return result;
	}
	
	public List<Map<String, Object>> select(Map<String, Object> pMap) throws Exception{
		
		List<Map<String, Object>> list = null;
		sqls = dbmgr.connection();
		list = sqls.selectList("select", list);
		sqls.close();
		
		return list;
	}
	
	public int update(Map<String,Object> pMap) throws Exception {
		
		int result = 0;
		sqls = dbmgr.connection();
		result = sqls.update("update", pMap);
		sqls.close();
		
		return result;
	}
	
	public int delete(Map<String,Object> pMap) throws Exception {
		
		int result = 0;
		sqls = dbmgr.connection();
		result = sqls.delete("update", pMap);
		sqls.close();
		
		return result;
	}

	
}
