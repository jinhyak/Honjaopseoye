package hj.logic;

import java.util.Map;

import org.apache.log4j.Logger;

public class StoreLogic extends AbstractLogic{
	Logger logger = Logger.getLogger(StoreLogic.class);
	
	public StoreLogic(Map<String,String> wMap) {
			super.wMap = wMap;
			super.Daoname = wMap.get("Daoname");
	}

	public int add(Map<String, Object> pMap) {
		// TODO Auto-generated method stub
		return 0;
	}
}
