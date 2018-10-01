package fPojo;

import java.io.Reader;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.apache.log4j.Logger;

public class memberDao {
	Logger logger = Logger.getLogger(memberDao.class);
	SqlSessionFactory sqlMapper = null;
	SqlSession sqlSes = null;
	String resource = "com/mybatis/MapperConfig.xml";

/*[[[[[[[[[[[[[[[[[[[[[[[[[[[[ �α��� ]]]]]]]]]]]]]]]]]]]]]]]]]]]]*/
	public Map<String,Object> login(Map<String,Object> pMap){
		logger.info("loginȣ�� ����");
		List<Map<String,Object>> list = null;
		Map<String,Object> rMap = null;
		try {
			Reader reader = null;
			reader = Resources.getResourceAsReader(resource);
			sqlMapper =
					new SqlSessionFactoryBuilder().build(reader);
			sqlSes =  sqlMapper.openSession();
			rMap = sqlSes.selectOne("mem_name", pMap);
			/*list = sqlSes.selectList("login", pMap);
			if(list!=null && list.size()==1) {
				rMap = list.get(0);
			}
			else{
				rMap = new HashMap<String,Object>();
				rMap.put("status", 0);
			}*/
		}catch(Exception e) {
			logger.info("exception : "+e.toString());
		}		
		return rMap;
	}

/*[[[[[[[[[[[[[[[[[[[[[[[[[[[[ ���̵�ã�� ]]]]]]]]]]]]]]]]]]]]]]]]]]]]*/
	public String idCheck(String mem_id) {
		//status ó��?
		
		return mem_id;
	}

/*[[[[[[[[[[[[[[[[[[[[[[[[[[[[ ȸ������ ]]]]]]]]]]]]]]]]]]]]]]]]]]]]*/	
	public int gaip(Map<String, Object> pMap) {
		logger.info("memoInsertȣ�� ����");
		int result = 0;
		try {
			Reader reader = null;
			reader = Resources.getResourceAsReader(resource);
			sqlMapper =
					 new SqlSessionFactoryBuilder().build(reader);
			sqlSes =  sqlMapper.openSession();
			result = sqlSes.insert("memoInsert", pMap);
			sqlSes.commit();
		}catch(Exception e) {
			logger.info("exception : "+e.toString());
		}
		return result;
	}
	
/*[[[[[[[[[[[[[[[[[[[[[[[[[[[[ �ּ� ]]]]]]]]]]]]]]]]]]]]]]]]]]]]*/	
	public List<Map<String, Object>> address(String dong) {
		logger.info("dong : "+dong);
		List<Map<String,Object>> zipCodeList = null;
		try {
			Reader reader = null;
			reader = Resources.getResourceAsReader(resource);
			sqlMapper =
					new SqlSessionFactoryBuilder().build(reader);
			sqlSes =  sqlMapper.openSession();
			zipCodeList = sqlSes.selectList("zipCodeList",dong);
			logger.info("zipCodeList.size():"+zipCodeList.size());
		}catch(Exception e) {
			logger.info("Exception : "+e.toString());
		}
		return zipCodeList;
	}
	
/*[[[[[[[[[[[[[[[[[[[[[[[[[[[[ ���̵� �ߺ��˻� ]]]]]]]]]]]]]]]]]]]]]]]]]]]]*/
	public int duplication(String mem_id) {
		logger.info("duplication ȣ�� ����");
		int status = 0;
		try {
			Reader reader = null;//2byte������(�ѱ�-2byte����ó��)
			reader = Resources.getResourceAsReader(resource);
			sqlMapper =
					new SqlSessionFactoryBuilder().build(reader);
			sqlSes =  sqlMapper.openSession();
			status = sqlSes.selectOne("duplication", mem_id);
		}catch(Exception e) {
			logger.info("exception : "+e.toString());
		}		
		return status;
	}

/*[[[[[[[[[[[[[[[[[[[[[[[[[[[[ ���� ���� ��ȸ ]]]]]]]]]]]]]]]]]]]]]]]]]]]]*/
	public List<Map<String,Object>> iSelect(Map<String,Object> pMap){
		logger.info("iSelect ȣ�� ����");
		List<Map<String,Object>> iList = null;
		try {
			Reader reader = null;
			reader = Resources.getResourceAsReader(resource);
			sqlMapper =
					new SqlSessionFactoryBuilder().build(reader);
			sqlSes =  sqlMapper.openSession();
			iList = sqlSes.selectList("iList", pMap);
			logger.info("iList.size():"+iList.size());
		}catch(Exception e) {
			logger.info("Exception : "+e.toString());
		}
		return iList;
	}

/*[[[[[[[[[[[[[[[[[[[[[[[[[[[[ ���� ���� ���� ]]]]]]]]]]]]]]]]]]]]]]]]]]]]*/
	public List<Map<String,Object>> iUpdate(Map<String,Object> pMap){
		logger.info("iUpdate ȣ�� ����");
		List<Map<String,Object>> iList = null;
		try {
			Reader reader = null;
			reader = Resources.getResourceAsReader(resource);
			sqlMapper =
					new SqlSessionFactoryBuilder().build(reader);
			sqlSes =  sqlMapper.openSession();
			iList = sqlSes.selectList("iList", pMap);
			logger.info("iList.size():"+iList.size());
		}catch(Exception e) {
			logger.info("Exception : "+e.toString());
		}
		return iList;
	}


/*[[[[[[[[[[[[[[[[[[[[[[[[[[[[ ȸ��Ż�� ]]]]]]]]]]]]]]]]]]]]]]]]]]]]*/	
	public int iDelete(int result) {
		return result;
	}
	
/*[[[[[[[[[[[[[[[[[[[[[[[[[[[[ ���۾��� ]]]]]]]]]]]]]]]]]]]]]]]]]]]]*/	
	public int wInsert(Map<String,Object> pMap) {
		logger.info("wInsertȣ�� ����");
		int result = 0;
		try {
			Reader reader = null;//2byte������(�ѱ�-2byte����ó��)
			reader = Resources.getResourceAsReader(resource);
			sqlMapper =
					 new SqlSessionFactoryBuilder().build(reader);
			sqlSes =  sqlMapper.openSession();
			result = sqlSes.insert("wInsert", pMap);
			sqlSes.commit();
		}catch(Exception e) {
			logger.info("exception : "+e.toString());
		}
		return result;	
	}
	
/*[[[[[[[[[[[[[[[[[[[[[[[[[[[[ �̹��� �߰� ]]]]]]]]]]]]]]]]]]]]]]]]]]]]*/	
	public int wImg(Map<String,Object> pMap){
		logger.info("memoInsertȣ�� ����");
		int img = 0;
		try {
			Reader reader = null;//2byte������(�ѱ�-2byte����ó��)
			reader = Resources.getResourceAsReader(resource);
			sqlMapper =
					 new SqlSessionFactoryBuilder().build(reader);
			sqlSes =  sqlMapper.openSession();
			img = sqlSes.insert("wImg", pMap);
			sqlSes.commit();
		}catch(Exception e) {
			logger.info("exception : "+e.toString());
		}
		return img;
	}


/*[[[[[[[[[[[[[[[[[[[[[[[[[[[[ ��۴ޱ� ]]]]]]]]]]]]]]]]]]]]]]]]]]]]*/	
	public int reply(Map<String,Object> pMap) {
		logger.info("reply ȣ�� ����");
		int result = 0;
		try {
			Reader reader = null;
			reader = Resources.getResourceAsReader(resource);
			sqlMapper =
					 new SqlSessionFactoryBuilder().build(reader);
			sqlSes =  sqlMapper.openSession();
			result = sqlSes.insert("reply", pMap);
			sqlSes.commit();
		}catch(Exception e) {
			logger.info("exception : "+e.toString());
		}
		return result;
	}

/*[[[[[[[[[[[[[[[[[[[[[[[[[[[[ ������ ]]]]]]]]]]]]]]]]]]]]]]]]]]]]*/	
	/*public int post(Map<String, Object> pMap) {
		logger.info("post ȣ�� ����");
		int result = 0;
		try {
			Reader reader = null;
			reader = Resources.getResourceAsReader(resource);
			sqlMapper =
					 new SqlSessionFactoryBuilder().build(reader);
			sqlSes =  sqlMapper.openSession();
			if(gubun.equals("ȥ��")) {				
			result = sqlSes.insert("sulPost", pMap);
			sqlSes.commit();
			}
			else if(gubun.equal("ȥ��")){
			result = sqlSes.insert("nolPost", pMap);
			sqlSes.commit();
			}
			else if(gubun.equal("ȥ��")){
			result = sqlSes.insert("babPost", pMap);
			sqlSes.commit();
			}
		}catch(Exception e) {
			logger.info("exception : "+e.toString());
		}
		return result;
	}*/
}
