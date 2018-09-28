package hj.dao;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.log4j.Logger;

import hj.common.DaoForm;
import hj.common.DbMgr;

public class MessageDao implements DaoForm{
	Logger logger = Logger.getLogger(this.getClass());
	DbMgr dbmgr = new DbMgr();
	SqlSession sqls = null;
	@Override
	public List<Map<String, Object>> select(Map<String, Object> pMap) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insert(Map<String, Object> pMap) throws IOException {
		int result = 0;
		sqls = dbmgr.connection();
		result = sqls.insert("messagemap.insert",pMap);
		sqls.commit();
		sqls.close();
		return result;
	}

	@Override
	public int update(Map<String, Object> pMap) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int delete(Map<String, Object> pMap) {
		// TODO Auto-generated method stub
		return 0;
	}
	public List<Map<String, Object>> msgListById(Map<String,Object> pMap){
		List<Map<String,Object>> list = null;
		try {
			sqls = dbmgr.connection();
			list = sqls.selectList("msgListById", pMap);
		} catch (IOException e) {
			e.printStackTrace();
			logger.info("msgListByID 메소드 오류");
		}
		sqls.close();
		return list;
	}
	public List<Map<String, Object>> msgListByRecent(Map<String,Object> pMap){
		List<Map<String,Object>> list = null;
		try {
			sqls = dbmgr.connection();
			list = sqls.selectList("msgListByRecent", pMap);
		} catch (IOException e) {
			e.printStackTrace();
			logger.info("msgListByRecent 메소드 오류");
		}
		sqls.close();
		return list;
	}

}
