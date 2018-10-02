package hj.dao;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.log4j.Logger;

import hj.common.DaoForm;
import hj.common.DbMgr;



public class HotPlaceDao implements DaoForm {
	Logger logger = Logger.getLogger(HotPlaceDao.class);
	DbMgr dbmgr = new DbMgr();
	SqlSession sqls = null;

	@Override
	public List<Map<String, Object>> select(Map<String, Object> pMap) throws IOException {
		List<Map<String,Object>> list = null;
		sqls = dbmgr.connection();
		logger.info("Dao Select호출 성공");
		list = sqls.selectList("hotplace.select",pMap);
		sqls.close();
		return list;
	}

	@Override
	public int insert(Map<String, Object> pMap) throws IOException {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int update(Map<String, Object> pMap) throws IOException {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int delete(Map<String, Object> pMap) throws IOException {
		// TODO Auto-generated method stub
		return 0;
	}

}
