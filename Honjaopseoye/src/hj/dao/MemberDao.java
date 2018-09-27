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

}
