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
/////"com/mybatis/mapper/menu.xml"�����ؾ���

/*[[[[[[[[[[[[[[[[[[[[[[[[[[[[ ������ �������� ]]]]]]]]]]]]]]]]]]]]]]]]]]]]*/	
	public List<Map<String,Object>> nSelect(Map<String,Object> pMap){
		logger.info("rInsert ȣ�� ����");
		List<Map<String,Object>> nList = new ArrayList<Map<String,Object>>();
		try {
			Reader reader = null; //2byte������(�ѱ�-2byte����ó��)
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
	
/*[[[[[[[[[[[[[[[[[[[[[[[[[[[[ �����ϱ� �Խ��� ]]]]]]]]]]]]]]]]]]]]]]]]]]]]*/	
	public List<Map<String,Object>> qSelect(Map<String,Object> pMap){
		logger.info("qSelect ȣ�� ����");
		List<Map<String,Object>> qList = new ArrayList<Map<String,Object>>();
		try {
			Reader reader = null; //2byte������(�ѱ�-2byte����ó��)
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
	
/*[[[[[[[[[[[[[[[[[[[[[[[[[[[[ �����ϱ� ]]]]]]]]]]]]]]]]]]]]]]]]]]]]*/	
	public int qInsert(Map<String,Object> pMap){
		logger.info("qInsert ȣ�� ����");
		int result = 0;
		try {
			Reader reader = null; //2byte������(�ѱ�-2byte����ó��)
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
	/*ma.put("fqa_title", "Ÿ��Ʋ");
	ma.put("fqa_category", "�з�");
	ma.put("fqa_pw", "123");
	ma.put("fqa_writer", "�ۼ���");
	ma.put("fqa_group", "�׷�");*/
	System.out.println(md.qSelect(ma));
	//System.out.println(md.memberList());
	//Dao�� �������� ���ư���.
	}
}
