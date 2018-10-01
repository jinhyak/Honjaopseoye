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

/*[[[[[[[[[[[[[[[[[[[[[[[[[[[[ 로그인 ]]]]]]]]]]]]]]]]]]]]]]]]]]]]*/
	public Map<String,Object> login(Map<String,Object> pMap){
		logger.info("login호출 성공");
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

/*[[[[[[[[[[[[[[[[[[[[[[[[[[[[ 아이디찾기 ]]]]]]]]]]]]]]]]]]]]]]]]]]]]*/
	public String idCheck(String mem_id) {
		//status 처리?
		
		return mem_id;
	}

/*[[[[[[[[[[[[[[[[[[[[[[[[[[[[ 회원가입 ]]]]]]]]]]]]]]]]]]]]]]]]]]]]*/	
	public int gaip(Map<String, Object> pMap) {
		logger.info("memoInsert호출 성공");
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
	
/*[[[[[[[[[[[[[[[[[[[[[[[[[[[[ 주소 ]]]]]]]]]]]]]]]]]]]]]]]]]]]]*/	
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
	
/*[[[[[[[[[[[[[[[[[[[[[[[[[[[[ 아이디 중복검사 ]]]]]]]]]]]]]]]]]]]]]]]]]]]]*/
	public int duplication(String mem_id) {
		logger.info("duplication 호출 성공");
		int status = 0;
		try {
			Reader reader = null;//2byte단위로(한글-2byte단위처리)
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

/*[[[[[[[[[[[[[[[[[[[[[[[[[[[[ 본인 정보 조회 ]]]]]]]]]]]]]]]]]]]]]]]]]]]]*/
	public List<Map<String,Object>> iSelect(Map<String,Object> pMap){
		logger.info("iSelect 호출 성공");
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

/*[[[[[[[[[[[[[[[[[[[[[[[[[[[[ 본인 정보 수정 ]]]]]]]]]]]]]]]]]]]]]]]]]]]]*/
	public List<Map<String,Object>> iUpdate(Map<String,Object> pMap){
		logger.info("iUpdate 호출 성공");
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


/*[[[[[[[[[[[[[[[[[[[[[[[[[[[[ 회원탈퇴 ]]]]]]]]]]]]]]]]]]]]]]]]]]]]*/	
	public int iDelete(int result) {
		return result;
	}
	
/*[[[[[[[[[[[[[[[[[[[[[[[[[[[[ 새글쓰기 ]]]]]]]]]]]]]]]]]]]]]]]]]]]]*/	
	public int wInsert(Map<String,Object> pMap) {
		logger.info("wInsert호출 성공");
		int result = 0;
		try {
			Reader reader = null;//2byte단위로(한글-2byte단위처리)
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
	
/*[[[[[[[[[[[[[[[[[[[[[[[[[[[[ 이미지 추가 ]]]]]]]]]]]]]]]]]]]]]]]]]]]]*/	
	public int wImg(Map<String,Object> pMap){
		logger.info("memoInsert호출 성공");
		int img = 0;
		try {
			Reader reader = null;//2byte단위로(한글-2byte단위처리)
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


/*[[[[[[[[[[[[[[[[[[[[[[[[[[[[ 답글달기 ]]]]]]]]]]]]]]]]]]]]]]]]]]]]*/	
	public int reply(Map<String,Object> pMap) {
		logger.info("reply 호출 성공");
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

/*[[[[[[[[[[[[[[[[[[[[[[[[[[[[ 포스팅 ]]]]]]]]]]]]]]]]]]]]]]]]]]]]*/	
	/*public int post(Map<String, Object> pMap) {
		logger.info("post 호출 성공");
		int result = 0;
		try {
			Reader reader = null;
			reader = Resources.getResourceAsReader(resource);
			sqlMapper =
					 new SqlSessionFactoryBuilder().build(reader);
			sqlSes =  sqlMapper.openSession();
			if(gubun.equals("혼술")) {				
			result = sqlSes.insert("sulPost", pMap);
			sqlSes.commit();
			}
			else if(gubun.equal("혼놀")){
			result = sqlSes.insert("nolPost", pMap);
			sqlSes.commit();
			}
			else if(gubun.equal("혼밥")){
			result = sqlSes.insert("babPost", pMap);
			sqlSes.commit();
			}
		}catch(Exception e) {
			logger.info("exception : "+e.toString());
		}
		return result;
	}*/
}
