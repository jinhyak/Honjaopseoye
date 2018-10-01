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

public class groupDao {
	Logger logger = Logger.getLogger(SqlMemberDao.class);
	SqlSessionFactory sqlMapper = null;
	SqlSession sqlSes = null;
	String resource = "com/mybatis/MapperConfig.xml";
/////"com/mybatis/mapper/store.xml"연동해야함

/*[[[[[[[[[[[[[[[[[[[[[[[[[[[[ 그룹 목록 조회 ]]]]]]]]]]]]]]]]]]]]]]]]]]]]*/
	public List<Map<String,Object>> gSelect(Map<String,Object> pMap){
		logger.info("gSelect 호출 성공");
		List<Map<String,Object>> gList = new ArrayList<Map<String,Object>>();
		try {
			Reader reader = null;//2byte단위로(한글-2byte단위처리)
			reader = Resources.getResourceAsReader(resource);
			sqlMapper =
					new SqlSessionFactoryBuilder().build(reader);
			sqlSes =  sqlMapper.openSession();
			gList = sqlSes.selectList("gList");
			logger.info("gList.size():"+gList.size());
		}catch(Exception e) {
			logger.info("Exception : "+e.toString());
		}
		return gList;
	}
	
/*[[[[[[[[[[[[[[[[[[[[[[[[[[[[ 그룹상세보기  ]]]]]]]]]]]]]]]]]]]]]]]]]]]]*/	
	public List<Map<String,Object>> gView(Map<String,Object> pMap){
		List<Map<String,Object>> gview = new ArrayList<Map<String,Object>>();
		try {
			Reader reader = null;//2byte단위로(한글-2byte단위처리)
			reader = Resources.getResourceAsReader(resource);
			sqlMapper =
					new SqlSessionFactoryBuilder().build(reader);
			sqlSes =  sqlMapper.openSession();
			gview = sqlSes.selectList("gview");
			logger.info("sview.size():"+gview.size());
		}catch(Exception e) {
			logger.info("Exception : "+e.toString());
		}
		return gview;
	}

/*[[[[[[[[[[[[[[[[[[[[[[[[[[[[ 그룹만들기 ]]]]]]]]]]]]]]]]]]]]]]]]]]]]*/
	public int gInsert(Map<String,Object> pMap) {
		logger.info("gInsert호출 성공");
		int result = 0;
		try {
			Reader reader = null;//2byte단위로(한글-2byte단위처리)
			reader = Resources.getResourceAsReader(resource);
			sqlMapper =
					 new SqlSessionFactoryBuilder().build(reader);
			sqlSes =  sqlMapper.openSession();
			result = sqlSes.insert("gInsert", pMap);
			sqlSes.commit();
		}catch(Exception e) {
			logger.info("exception : "+e.toString());
		}
		return result;
	}
	
/*[[[[[[[[[[[[[[[[[[[[[[[[[[[[ 그룹정보수정 ]]]]]]]]]]]]]]]]]]]]]]]]]]]]*/
	public int gUpdate(Map<String,Object> pMap) {
		logger.info("gUpdate호출 성공");
		int result = 0;
		try {
			Reader reader = null;//2byte단위로(한글-2byte단위처리)
			reader = Resources.getResourceAsReader(resource);
			sqlMapper =
					 new SqlSessionFactoryBuilder().build(reader);
			sqlSes =  sqlMapper.openSession();
			result = sqlSes.insert("gUpdate", pMap);
			sqlSes.commit();
		}catch(Exception e) {
			logger.info("exception : "+e.toString());
		}
		return result;
	}
	
/*[[[[[[[[[[[[[[[[[[[[[[[[[[[[ 신고하기 ]]]]]]]]]]]]]]]]]]]]]]]]]]]]*/
	public int report(Map<String,Object> pMap) {
		logger.info("report호출 성공");
		int result = 0;
		try {
			Reader reader = null;//2byte단위로(한글-2byte단위처리)
			reader = Resources.getResourceAsReader(resource);
			sqlMapper =
					 new SqlSessionFactoryBuilder().build(reader);
			sqlSes =  sqlMapper.openSession();
			result = sqlSes.insert("report", pMap);
			sqlSes.commit();
		}catch(Exception e) {
			logger.info("exception : "+e.toString());
		}
		return result;
	}

}
