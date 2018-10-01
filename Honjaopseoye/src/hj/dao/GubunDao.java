package hj.dao;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.log4j.Logger;

import hj.common.DaoForm;
import hj.common.DbMgr;

public class GubunDao implements DaoForm{
	Logger logger = Logger.getLogger(TestDao.class);
	DbMgr dbmgr = new DbMgr();
	SqlSession sqls = null;
	
	@Override
	public List<Map<String, Object>> select(Map<String, Object> pMap) throws IOException {
		return null;
	}

	@Override
	public int insert(Map<String, Object> pMap) throws IOException {
		return 0;
	}

	@Override
	public int update(Map<String, Object> pMap) throws IOException {
		return 0;
	}

	@Override
	public int delete(Map<String, Object> pMap) throws IOException {
		return 0;
	}
	
	public List<Map<String, Object>> doselect(Map<String, Object> pMap) throws IOException {
		logger.info("doselect 호출 성공");
		List<Map<String, Object>> list = null;
		sqls = dbmgr.connection();
		list = sqls.selectList("doselect", pMap);
		sqls.close();
		
		return list;
	}
	
	public List<Map<String, Object>> siselect(Map<String, Object> pMap) throws IOException {
		logger.info("siselcet 호출 성공");
		List<Map<String, Object>> list = null;
		sqls = dbmgr.connection();
		list = sqls.selectList("siselect", pMap);
		logger.info(list);
		sqls.close();		
		
		return list;
	}
	public List<Map<String, Object>> dongselect(Map<String, Object> pMap) throws IOException {
		logger.info("siselcet 호출 성공");
		List<Map<String, Object>> list = null;
		sqls = dbmgr.connection();
		list = sqls.selectList("dongselect", pMap);
		logger.info(list);
		sqls.close();		
		
		return list;
	}
	public List<Map<String, Object>> detailselect(Map<String, Object> pMap) throws IOException {
		logger.info("상세주소 호출 성공");
		List<Map<String, Object>> list = null;
		sqls = dbmgr.connection();
		list = sqls.selectList("detailselect", pMap);
		logger.info(list);
		sqls.close();
		
		return list;
	}

}
