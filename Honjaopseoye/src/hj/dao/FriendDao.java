package hj.dao;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.log4j.Logger;

import hj.common.DaoForm;
import hj.common.DbMgr;

public class FriendDao implements DaoForm{
	DbMgr dbmgr = new DbMgr();
	SqlSession sqls = null;
	Logger logger = Logger.getLogger(this.getClass());
	@Override
	public List<Map<String, Object>> select(Map<String, Object> pMap) throws IOException {
		List<Map<String, Object>> list = null;
		sqls = dbmgr.connection();
		list = sqls.selectList("friendmap.select",pMap);
		logger.info(list);
		sqls.close();
		return list;
	}
	public List<Map<String, Object>> fri_select(Map<String, Object> pMap) throws IOException {
		List<Map<String, Object>> list = null;
		sqls = dbmgr.connection();
		list = sqls.selectList("fri_select",pMap);
		logger.info(list);
		sqls.close();
		return list;
	}

	@Override
	public int insert(Map<String, Object> pMap) throws IOException {
		int result = 0;
		sqls = dbmgr.connection();
		result = sqls.insert("fri_add", pMap);
		result = sqls.insert("friadd", pMap);
		logger.info(result);
		sqls.commit();
		sqls.close();
		return result;
	}

	@Override
	public int update(Map<String, Object> pMap) throws IOException {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int delete(Map<String, Object> pMap) throws IOException {
		int result = 0;
		sqls = dbmgr.connection();
		result = sqls.delete("fri_del", pMap);
		logger.info(result);
		sqls.commit();
		sqls.close();
		return result;
	}

}
