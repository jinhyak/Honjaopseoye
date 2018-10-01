package fPojo;

import java.io.Reader;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.apache.log4j.Logger;

import com.pojo.SqlMemberDao;

public class friendDao {
	Logger logger = Logger.getLogger(SqlMemberDao.class);
	SqlSessionFactory sqlMapper = null;
	SqlSession sqlSes = null;
	String resource = "com/mybatis/MapperConfig.xml";
/////"com/mybatis/mapper/menu.xml"연동해야함
	
/*[[[[[[[[[[[[[[[[[[[[[[[[[[[[ 친구목록 조회 ]]]]]]]]]]]]]]]]]]]]]]]]]]]]*/	
	public List<Map<String,Object>> fSelect(Map<String,Object> pMap){
		logger.info("fSelect 호출 성공");
		List<Map<String,Object>> fList = new ArrayList<Map<String,Object>>();
		try {
			Reader reader = null; //2byte단위로(한글-2byte단위처리)
			reader = Resources.getResourceAsReader(resource);
			sqlMapper = new SqlSessionFactoryBuilder().build(reader);
			sqlSes  = sqlMapper.openSession();
			reader.close();
			fList = sqlSes.selectList("fSelect",pMap);
			sqlSes.commit();
			logger.info("fSelect: "+fList);
		} catch (Exception e) {
			logger.info("exception"+e.toString());
		}
		return fList;
	}

/*[[[[[[[[[[[[[[[[[[[[[[[[[[[[ 친구 추가하기 ]]]]]]]]]]]]]]]]]]]]]]]]]]]]*/	
	public int fInsert(Map<String,Object> pMap){
		logger.info("fInsert 호출 성공");
		int result = 0;
		try {
			Reader reader = null; //2byte단위로(한글-2byte단위처리)
			reader = Resources.getResourceAsReader(resource);
			sqlMapper = new SqlSessionFactoryBuilder().build(reader);
			sqlSes  = sqlMapper.openSession();
			reader.close();
			result = sqlSes.insert("fInsert",pMap);
			if(result == 1) {
				sqlSes.commit();
			}
			logger.info("fInsert: "+result);
		} catch (Exception e) {
			logger.info("exception"+e.toString());
		}
		return result;
	}

/*[[[[[[[[[[[[[[[[[[[[[[[[[[[[ 친구 상세보기 ]]]]]]]]]]]]]]]]]]]]]]]]]]]]*/	
	public List<Map<String,Object>> fView(Map<String,Object> pMap){
		logger.info("fView 호출 성공");
		List<Map<String,Object>> fvList = new ArrayList<Map<String,Object>>();
		try {
			Reader reader = null; //2byte단위로(한글-2byte단위처리)
			reader = Resources.getResourceAsReader(resource);
			sqlMapper = new SqlSessionFactoryBuilder().build(reader);
			sqlSes  = sqlMapper.openSession();
			reader.close();
			fvList = sqlSes.selectList("fView",pMap);
			sqlSes.commit();
			logger.info("fView: "+ fvList);
		} catch (Exception e) {
			logger.info("exception"+e.toString());
		}
		return fvList;
	}
	
/*[[[[[[[[[[[[[[[[[[[[[[[[[[[[ 친구 상세보기 ]]]]]]]]]]]]]]]]]]]]]]]]]]]]*/	
	public int fDelete(){
		logger.info("fDelete 호출 성공");
		int result = 0;
		try {
			Reader reader = null; //2byte단위로(한글-2byte단위처리)
			reader = Resources.getResourceAsReader(resource);
			sqlMapper = new SqlSessionFactoryBuilder().build(reader);
			sqlSes  = sqlMapper.openSession();
			reader.close();
			result = sqlSes.delete(resource);
			sqlSes.commit();
			logger.info("fDelete: "+ result);
		} catch (Exception e) {
			logger.info("exception"+e.toString());
		}
		return result;
	}	

/*[[[[[[[[[[[[[[[[[[[[[[[[[[[[ 쪽지 목록보기 ]]]]]]]]]]]]]]]]]]]]]]]]]]]]*/	
	public List<Map<String,Object>> mSelect(Map<String,Object> pMap){
		logger.info("mSelect 호출 성공");
		List<Map<String,Object>> mList = new ArrayList<Map<String,Object>>();
		try {
			Reader reader = null; //2byte단위로(한글-2byte단위처리)
			reader = Resources.getResourceAsReader(resource);
			sqlMapper = new SqlSessionFactoryBuilder().build(reader);
			sqlSes  = sqlMapper.openSession();
			reader.close();
			mList = sqlSes.selectList("mSelect",pMap);
			sqlSes.commit();
			logger.info("mSelect: "+mList);
		} catch (Exception e) {
			logger.info("exception"+e.toString());
		}
		return mList;
	}

/*[[[[[[[[[[[[[[[[[[[[[[[[[[[[ 쪽지 보기 ]]]]]]]]]]]]]]]]]]]]]]]]]]]]*/	
	public List<Map<String,Object>> mView(Map<String,Object> pMap){
		logger.info("fView 호출 성공");
		List<Map<String,Object>> fvList = new ArrayList<Map<String,Object>>();
		try {
			Reader reader = null; //2byte단위로(한글-2byte단위처리)
			reader = Resources.getResourceAsReader(resource);
			sqlMapper = new SqlSessionFactoryBuilder().build(reader);
			sqlSes  = sqlMapper.openSession();
			reader.close();
			fvList = sqlSes.selectList("fView",pMap);
			sqlSes.commit();
			logger.info("fView: "+ fvList);
		} catch (Exception e) {
			logger.info("exception"+e.toString());
		}
		return fvList;
	}
	
/*[[[[[[[[[[[[[[[[[[[[[[[[[[[[ 쪽지 보내기 ]]]]]]]]]]]]]]]]]]]]]]]]]]]]*/	
	public int mInsert(Map<String,Object> pMap){
		logger.info("mInsert 호출 성공");
		int result = 0;
		try {
			Reader reader = null; //2byte단위로(한글-2byte단위처리)
			reader = Resources.getResourceAsReader(resource);
			sqlMapper = new SqlSessionFactoryBuilder().build(reader);
			sqlSes  = sqlMapper.openSession();
			reader.close();
			result = sqlSes.insert("mInsert",pMap);
			if(result == 1) {
				sqlSes.commit();
			}
			logger.info("mInsert: "+result);
		} catch (Exception e) {
			logger.info("exception"+e.toString());
		}
		return result;
	}

}
