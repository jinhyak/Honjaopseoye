package hj.logic;

import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;

public class HotPlaceLogic extends AbstractLogic{
	Logger logger = Logger.getLogger(HotPlaceLogic.class);
	public HotPlaceLogic(Map<String, String> wMap) {
			super.wMap = wMap;
			super.Daoname = wMap.get("Daoname");
	}
	
	Map<String,Object> rMap = null;
	List<Map<String,Object>> list = null;
	
	public Map<String, Object> show(Map<String, Object> pMap) throws Exception{
		//abstractLogic에 추가하셈 List받는거
		logger.info(wMap.get("Ctrname")+Daoname);
		if("hotplace".equals(wMap.get("Ctrname"))) {
			logger.info(pMap.get("choice"));
			logger.info(pMap.get("searchWord"));
			rMap = gethotPlace(pMap);
		}
		
		return rMap;
	}
	
	
}
