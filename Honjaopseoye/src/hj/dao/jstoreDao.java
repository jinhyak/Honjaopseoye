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
/////"com/mybatis/mapper/store.xml"�����ؾ���
	
/*************************************************
 * 
 * @param pMap
 * @return result : ������ �����ϸ� 1, �����ϸ� -1
 */
	public int rInsert(Map<String,Object> pMap){
		logger.info("rInsert ȣ�� ����");
		int result = 0;
		try {
			Reader reader = null; //2byte������(�ѱ�-2byte����ó��)
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
	
/*[[[[[[[[[[[[[[[[[[[[[[[[[[[[ ���� ��� ]]]]]]]]]]]]]]]]]]]]]]]]]]]]*/	
	public int rDelete(){
		logger.info("rDelete ȣ�� ����");
		int result = 0;
		try {
			Reader reader = null; //2byte������(�ѱ�-2byte����ó��)
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
 * @param pMap : ȥ��|ȥ��|ȥ�� ������ + select + ���ǰ˻��Ͻ� where ���ǰ� .
 * @return sList : ȥ��|ȥ��|ȥ�� ���� ���� ����� �޾ƿ�.
 */
	public List<Map<String,Object>> sSelect(Map<String,Object> pMap){
		List<Map<String,Object>> sList = new ArrayList<Map<String,Object>>();
		try {
			Reader reader = null;//2byte������(�ѱ�-2byte����ó��)
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

/*[[[[[[[[[[[[[[[[[[[[[[[[[[[[ ���� �󼼺��� ]]]]]]]]]]]]]]]]]]]]]]]]]]]]*/	
	public List<Map<String,Object>> sView(Map<String,Object> pMap){
		List<Map<String,Object>> sview = new ArrayList<Map<String,Object>>();
		try {
			Reader reader = null;//2byte������(�ѱ�-2byte����ó��)
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

/*[[[[[[[[[[[[[[[[[[[[[[[[[[[[ ��ް��� ]]]]]]]]]]]]]]]]]]]]]]]]]]]]*/
	public String good() {
		String rate = "�����";
		try {
			Reader reader = null;//2byte������(�ѱ�-2byte����ó��)
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

/*[[[[[[[[[[[[[[[[[[[[[[[[[[[[ ���亸�� ]]]]]]]]]]]]]]]]]]]]]]]]]]]]*/	
	public List<Map<String,Object>> pSelect(Map<String,Object> pMap){
		List<Map<String,Object>> pList = new ArrayList<Map<String,Object>>();
		try {
			Reader reader = null;//2byte������(�ѱ�-2byte����ó��)
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
	
/*[[[[[[[[[[[[[[[[[[[[[[[[[[[[ ���侲�� ]]]]]]]]]]]]]]]]]]]]]]]]]]]]*/
	public int pInsert(Map<String,Object> pMap) {
		logger.info("pInsertȣ�� ����");
		int result = 0;
		try {
			Reader reader = null;//2byte������(�ѱ�-2byte����ó��)
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
	 * @return total record - ����¡ ó��, ����¡ó�� �˰��� ó��(5,10 �� -> �̹����Խ��� �� ������ó��, ������������ ������ ��)
	 ***********************************************************/
	public int totalCount() {
		logger.info("totalCount ȣ�� ����");
		int total = 0; //��ü ���ڵ� ���� ���� ����
		try {
			Reader reader = null;//2byte������(�ѱ�-2byte����ó��)
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
