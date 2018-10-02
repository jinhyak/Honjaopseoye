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
	
	
	// 자신의 게시글 INSERT 이후 바로 조회후 보기 
	public List<Map<String, Object>> boardOneSelect(Map<String, Object> pMap) {
		
		logger.info("boardOneSelect 호출");
		
		List<Map<String,Object>> boardOneSelectList = null;
		
		try {
			Reader reader = Resources.getResourceAsReader(resource);
			logger.info(" <MapperConfig> XML => DB 계정에 이상 없습니다.");
			
			sqlMapper = new SqlSessionFactoryBuilder().build(reader);
			logger.info("해당 XML에 이상 없습니다.");
			
			sqlSes =  sqlMapper.openSession();
			logger.info("쿼리문 처리를 준비 합니다.");
			
			boardOneSelectList = sqlSes.selectList("boardOneSelect", pMap);
			logger.info(" boardOneSelect => 쿼리문에 이상이 없습니다.");
			
			logger.info(" 결과 값 확인: "+boardOneSelectList.size());
		}catch(Exception e) {
			
			logger.info("Exception : "+e.toString());
		}
		return boardOneSelectList;
	}
	
	// 자신의 게시글 INSERT DB에 저장
	public int boardOneInsert(Map<String, Object> pMap) {
		
		logger.info("boardOneInsert 호출");
		
			int result = 0;
			
			try {
				
				Reader reader = Resources.getResourceAsReader(resource);
				logger.info(" <MapperConfig> XML => DB 계정에 이상 없습니다.");
				
				sqlMapper = new SqlSessionFactoryBuilder().build(reader);
				logger.info("해당 XML에 이상 없습니다.");
				
				sqlSes =  sqlMapper.openSession();
				logger.info("쿼리문 처리를 준비 합니다.");
				
				result = sqlSes.insert("boardOneInsert",pMap);
				logger.info(" boardOneInsert => 쿼리문에 이상이 없습니다.");
				
				if(result == 1) {
					
					sqlSes.commit();
					logger.info("DB 저장을 완료 하였습니다.");
				}
				
				logger.info("성공 여부 : "+result);
				
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
