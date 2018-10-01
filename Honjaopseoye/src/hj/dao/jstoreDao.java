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

public class storeDao {
	Logger logger = Logger.getLogger(SqlMemberDao.class);
	SqlSessionFactory sqlMapper = null;
	SqlSession sqlSes = null;
	String resource = "com/mybatis/MapperConfig.xml";
/////"com/mybatis/mapper/store.xml"연동해야함
	
/*************************************************
 * 
 * @param pMap
 * @return result : 예약이 성공하면 1, 거절하면 -1
 */
	public int rInsert(Map<String,Object> pMap){
		logger.info("rInsert 호출 성공");
		int result = 0;
		try {
			Reader reader = null; //2byte단위로(한글-2byte단위처리)
			reader = Resources.getResourceAsReader(resource);
			sqlMapper = new SqlSessionFactoryBuilder().build(reader);
			sqlSes  = sqlMapper.openSession();
			reader.close();
			result = sqlSes.insert("rInsert",pMap);
			System.out.println(result);
			if(result == 1) {
				sqlSes.commit();
			}
		} catch (Exception e) {
			logger.info("exception"+e.toString());
		}
		return result; 
	}
	
/*[[[[[[[[[[[[[[[[[[[[[[[[[[[[ 예약 취소 ]]]]]]]]]]]]]]]]]]]]]]]]]]]]*/	
	public int rDelete(){
		logger.info("rDelete 호출 성공");
		int result = 0;
		try {
			Reader reader = null; //2byte단위로(한글-2byte단위처리)
			reader = Resources.getResourceAsReader(resource);
			sqlMapper = new SqlSessionFactoryBuilder().build(reader);
			sqlSes  = sqlMapper.openSession();
			reader.close();
			result = sqlSes.delete(null);
			System.out.println(result);
			sqlSes.commit();
		} catch (Exception e) {
			logger.info("exception"+e.toString());
		}
		return result;
	}

/***********************************************************
 * 
 * @param pMap : 혼술|혼밥|혼놀 구분자 + select + 조건검색일시 where 조건값 .
 * @return sList : 혼술|혼밥|혼놀 에서 가게 목록을 받아옴.
 */
	public List<Map<String,Object>> sSelect(Map<String,Object> pMap){
		List<Map<String,Object>> sList = new ArrayList<Map<String,Object>>();
		try {
			Reader reader = null;//2byte단위로(한글-2byte단위처리)
			reader = Resources.getResourceAsReader(resource);
			sqlMapper =
					new SqlSessionFactoryBuilder().build(reader);
			sqlSes =  sqlMapper.openSession();
			sList = sqlSes.selectList("sList");
			logger.info("sList.size():"+sList.size());
		}catch(Exception e) {
			logger.info("Exception : "+e.toString());
		}
		return sList;
	}

/*[[[[[[[[[[[[[[[[[[[[[[[[[[[[ 가게 상세보기 ]]]]]]]]]]]]]]]]]]]]]]]]]]]]*/	
	public List<Map<String,Object>> sView(Map<String,Object> pMap){
		List<Map<String,Object>> sview = new ArrayList<Map<String,Object>>();
		try {
			Reader reader = null;//2byte단위로(한글-2byte단위처리)
			reader = Resources.getResourceAsReader(resource);
			sqlMapper =
					new SqlSessionFactoryBuilder().build(reader);
			sqlSes =  sqlMapper.openSession();
			sview = sqlSes.selectList("sview");
			logger.info("sview.size():"+sview.size());
		}catch(Exception e) {
			logger.info("Exception : "+e.toString());
		}
		return sview;
	}

/*[[[[[[[[[[[[[[[[[[[[[[[[[[[[ 등급관리 ]]]]]]]]]]]]]]]]]]]]]]]]]]]]*/
	public String good() {
		String rate = "브론즈";
		try {
			Reader reader = null;//2byte단위로(한글-2byte단위처리)
			reader = Resources.getResourceAsReader(resource);
			sqlMapper =
					new SqlSessionFactoryBuilder().build(reader);
			sqlSes =  sqlMapper.openSession();
			rate = sqlSes.toString();
			logger.info("rate"+rate);
		}catch(Exception e) {
			logger.info("Exception : "+e.toString());
		}
		return rate;
	}

/*[[[[[[[[[[[[[[[[[[[[[[[[[[[[ 리뷰보기 ]]]]]]]]]]]]]]]]]]]]]]]]]]]]*/	
	public List<Map<String,Object>> pSelect(Map<String,Object> pMap){
		List<Map<String,Object>> pList = new ArrayList<Map<String,Object>>();
		try {
			Reader reader = null;//2byte단위로(한글-2byte단위처리)
			reader = Resources.getResourceAsReader(resource);
			sqlMapper =
					new SqlSessionFactoryBuilder().build(reader);
			sqlSes =  sqlMapper.openSession();
			pList = sqlSes.selectList("pList");
			logger.info("pList.size():"+pList.size());
		}catch(Exception e) {
			logger.info("Exception : "+e.toString());
		}
		return pList;
	}
	
/*[[[[[[[[[[[[[[[[[[[[[[[[[[[[ 리뷰쓰기 ]]]]]]]]]]]]]]]]]]]]]]]]]]]]*/
	public int pInsert(Map<String,Object> pMap) {
		logger.info("pInsert호출 성공");
		int result = 0;
		try {
			Reader reader = null;//2byte단위로(한글-2byte단위처리)
			reader = Resources.getResourceAsReader(resource);
			sqlMapper =
					 new SqlSessionFactoryBuilder().build(reader);
			sqlSes =  sqlMapper.openSession();
			result = sqlSes.insert("pInsert", pMap);
			sqlSes.commit();
		}catch(Exception e) {
			logger.info("exception : "+e.toString());
		}
		return result;
	}

	/***********************************************************
	 * 
	 * @return total record - 페이징 처리, 페이징처리 알고리즘 처리(5,10 씩 -> 이미지게시판 쓸 페이지처리, 뉴스페이지에 적용할 값)
	 ***********************************************************/
	public int totalCount() {
		logger.info("totalCount 호출 성공");
		int total = 0; //전체 레코드 수를 담을 변수
		try {
			Reader reader = null;//2byte단위로(한글-2byte단위처리)
			reader = Resources.getResourceAsReader(resource);
			sqlMapper =
					new SqlSessionFactoryBuilder().build(reader);
			sqlSes =  sqlMapper.openSession();
			total = sqlSes.selectOne("totalCount");
			logger.info("total: "+total);
		}catch(Exception e) {
			logger.info("Exception : "+e.toString());
		}
		return total;
	}

}
