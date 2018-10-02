package hj.dao;

import java.io.Reader;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.apache.log4j.Logger;

import hj.common.DaoForm;

public class BoardDao implements DaoForm{

	Logger logger = Logger.getLogger(BoardDao.class);
	SqlSessionFactory sqlMapper = null;
	SqlSession sqlSes = null;
	String resource = "com/mybatis/MapperConfig.xml";
	
	
	// �ڽ��� �Խñ� INSERT ���� �ٷ� ��ȸ�� ���� 
	public List<Map<String, Object>> boardOneSelect(Map<String, Object> pMap) {
		
		logger.info("boardOneSelect ȣ��");
		
		List<Map<String,Object>> boardOneSelectList = null;
		
		try {
			Reader reader = Resources.getResourceAsReader(resource);
			logger.info(" <MapperConfig> XML => DB ������ �̻� �����ϴ�.");
			
			sqlMapper = new SqlSessionFactoryBuilder().build(reader);
			logger.info("�ش� XML�� �̻� �����ϴ�.");
			
			sqlSes =  sqlMapper.openSession();
			logger.info("������ ó���� �غ� �մϴ�.");
			
			boardOneSelectList = sqlSes.selectList("boardOneSelect", pMap);
			logger.info(" boardOneSelect => �������� �̻��� �����ϴ�.");
			
			logger.info(" ��� �� Ȯ��: "+boardOneSelectList.size());
		}catch(Exception e) {
			
			logger.info("Exception : "+e.toString());
		}
		return boardOneSelectList;
	}
	
	// �ڽ��� �Խñ� INSERT DB�� ����
	public int boardOneInsert(Map<String, Object> pMap) {
		
		logger.info("boardOneInsert ȣ��");
		
			int result = 0;
			
			try {
				
				Reader reader = Resources.getResourceAsReader(resource);
				logger.info(" <MapperConfig> XML => DB ������ �̻� �����ϴ�.");
				
				sqlMapper = new SqlSessionFactoryBuilder().build(reader);
				logger.info("�ش� XML�� �̻� �����ϴ�.");
				
				sqlSes =  sqlMapper.openSession();
				logger.info("������ ó���� �غ� �մϴ�.");
				
				result = sqlSes.insert("boardOneInsert",pMap);
				logger.info(" boardOneInsert => �������� �̻��� �����ϴ�.");
				
				if(result == 1) {
					
					sqlSes.commit();
					logger.info("DB ������ �Ϸ� �Ͽ����ϴ�.");
				}
				
				logger.info("���� ���� : "+result);
				
			}catch(Exception e) {
				logger.info("Exception : "+e.toString());
			}
			return result;		
		}
	
	
	
	@Override
	public List<Map<String, Object>> select(Map<String, Object> pMap) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insert(Map<String, Object> pMap) {
		// TODO Auto-generated method stub
		return 0;
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

}
