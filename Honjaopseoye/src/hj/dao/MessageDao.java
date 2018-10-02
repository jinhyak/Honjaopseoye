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
	public List<Map<String, Object>> msgListByRecent(Map<String,Object> pMap){
		List<Map<String,Object>> list = null;
		try {
			sqls = dbmgr.connection();
			list = sqls.selectList("msgListByRecent", pMap);
			readMsg(pMap);
		} catch (IOException e) {
			e.printStackTrace();
			logger.info("msgListByRecent 메소드 오류");
		}
		sqls.close();
		return list;
	}
	public int readMsg(Map<String, Object> pMap) {
		int result = 0;
		try {
			sqls = dbmgr.connection();
			result = sqls.update("readMsg", pMap);
		} catch (IOException e) {
			e.printStackTrace();
			logger.info("ReadMsg 메소드 오류");
		}
		sqls.commit();
		sqls.close();
		return result;
	}
	public String allUnReadMsg(Map<String,Object> pMap) {
		String result = "";
		try {
			sqls = dbmgr.connection();
			result = sqls.selectOne("allUnReadMsg", pMap);
		} catch (IOException e) {
			e.printStackTrace();
			logger.info("allUnReadMsg 메소드 오류");
			result="";
		}
		sqls.close();
		return result;
	}
	public List<Map<String, Object>> getmsgBox(Map<String,Object> pMap){
		List<Map<String, Object>> list = null;
		try {
			sqls=dbmgr.connection();
			list = sqls.selectList("getmsgBox", pMap);
			for(int i = 0;i<list.size();i++) {
				Map<String, Object> xMap = list.get(i);
				for(int j=0;j<list.size();j++) {
					Map<String, Object> yMap = list.get(j);
					if(xMap.get("MSG_FROM").toString().equals(yMap.get("MSG_TO").toString())&&xMap.get("MSG_TO").toString().equals(yMap.get("MSG_FROM").toString())) {
						if(Integer.parseInt(xMap.get("MSG_NO").toString())<Integer.parseInt(yMap.get("MSG_NO").toString())) {
							list.remove(xMap);
							i--;
							break;
						}
						else {
							list.remove(yMap);
							j--;
						}
					}
				}
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		return list;
		
	}
	public String unReadMsg(Map<String, Object> pMap) {
		String result = "";
		try {
			sqls = dbmgr.connection();
			result = sqls.selectOne("unReadMsg", pMap);
		} catch (IOException e) {
			e.printStackTrace();
			logger.info("unReadMsg 메소드 오류");
			result="";
		}
		sqls.close();
		return result;
	}

}
