package hj.logic;

import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;


public class Logic extends AbstractLogic{
	Logger logger = Logger.getLogger(Logic.class);
	public Logic(Map<String, String> wMap) {
		super.wMap = wMap;
		super.Daoname = wMap.get("Daoname");
	}
	Map<String, Object> rMap = null;
	
	public int sum(Map<String, Object> pMap) throws Exception {

		
		
//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ boardController에서 온건지. testController에서 온건지 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
		if("board".equals(wMap.get("Ctrname"))) {
			rMap = boardLogic(pMap);/////return 타입 모두 rMap임 여기 안에 int or list가 담겨있음.
		}
		else if("test".equals(wMap.get("Ctrname"))) {
			rMap = testLogic(pMap);
		}
		else if("message".equals(wMap.get("Ctrname"))) {
			
			
			
		}
		
		
		
		
		
		
		return result;
	}
	
	public int avg(Map<String, Object> pMap) throws Exception {
		
		
		
		if("board".equals(wMap.get("Ctrname"))) {
			rMap = boardLogic(pMap);
		}
		else if("test".equals(wMap.get("Ctrname"))) {
			rMap = testLogic(pMap);
		}
		

		
		
		return 0;
	}
	
	

	
	
	
}
