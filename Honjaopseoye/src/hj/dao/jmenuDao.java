package fPojo;

import java.io.Reader;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.apache.log4j.Logger;

import com.pojo.SqlMemberDao;

public class menuDao {
	Logger logger = Logger.getLogger(SqlMemberDao.class);
	SqlSessionFactory sqlMapper = null;
	SqlSession sqlSes = null;
	String resource = "com/mybatis/MapperConfig.xml";
/////"com/mybatis/mapper/menu.xml"연동해야함

/*[[[[[[[[[[[[[[[[[[[[[[[[[[[[ 관리자 공지사항 ]]]]]]]]]]]]]]]]]]]]]]]]]]]]*/	
	public List<Map<String,Object>> nSelect(Map<String,Object> pMap){
		logger.info("rInsert 호출 성공");
		List<Map<String,Object>> nList = new ArrayList<Map<String,Object>>();
		try {
			Reader reader = null; //2byte단위로(한글-2byte단위처리)
			reader = Resources.getResourceAsReader(resource);
			sqlMapper = new SqlSessionFactoryBuilder().build(reader);
			sqlSes  = sqlMapper.openSession();
			reader.close();
			nList = sqlSes.selectList("nSelect",pMap);
			sqlSes.commit();
			logger.info("nSelect: "+nList);
		} catch (Exception e) {
			logger.info("exception"+e.toString());
		}
		return nList;
	}
	
/*[[[[[[[[[[[[[[[[[[[[[[[[[[[[ 문의하기 게시판 ]]]]]]]]]]]]]]]]]]]]]]]]]]]]*/	
	public List<Map<String,Object>> qSelect(Map<String,Object> pMap){
		logger.info("qSelect 호출 성공");
		List<Map<String,Object>> qList = new ArrayList<Map<String,Object>>();
		try {
			Reader reader = null; //2byte단위로(한글-2byte단위처리)
			reader = Resources.getResourceAsReader(resource);
			sqlMapper = new SqlSessionFactoryBuilder().build(reader);
			sqlSes  = sqlMapper.openSession();
			reader.close();
			qList = sqlSes.selectList("qSelect",pMap);
			sqlSes.commit();
			logger.info("qSelect: "+qList);
		} catch (Exception e) {
			logger.info("exception"+e.toString());
		}
		return qList;
	}
	
/*[[[[[[[[[[[[[[[[[[[[[[[[[[[[ 문의하기 ]]]]]]]]]]]]]]]]]]]]]]]]]]]]*/	
	public int qInsert(Map<String,Object> pMap){
		logger.info("qInsert 호출 성공");
		int result = 0;
		try {
			Reader reader = null; //2byte단위로(한글-2byte단위처리)
			reader = Resources.getResourceAsReader(resource);
			sqlMapper = new SqlSessionFactoryBuilder().build(reader);
			sqlSes  = sqlMapper.openSession();
			reader.close();
			result = sqlSes.insert("qInsert",pMap);
			if(result == 1) {
				sqlSes.commit();
			}
			logger.info("qInsert: "+result);
		} catch (Exception e) {
			logger.info("exception"+e.toString());
		}
		return result;
	}
	
	public static void main(String[] args) {
	menuDao md = new menuDao();
	Map<String,Object> ma = new HashMap<String,Object>();
	/*ma.put("mem_id", "jin");
	ma.put("mem_pw", "111");
	ma.put("mem_name", "kim");*/
	ma.put("fqa_no", 1);
	/*ma.put("fqa_title", "타이틀");
	ma.put("fqa_category", "분류");
	ma.put("fqa_pw", "123");
	ma.put("fqa_writer", "작성자");
	ma.put("fqa_group", "그룹");*/
	System.out.println(md.qSelect(ma));
	//System.out.println(md.memberList());
	//Dao는 정상으로 돌아간다.
	}
}
