package hj.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import hj.common.ControllerForm;
import hj.common.HashMapBinder;
import hj.common.Model;
import hj.logic.StoreLogic;

public class StoreController implements ControllerForm{
	Logger logger = Logger.getLogger(this.getClass());
	@Override
	public Model excute(HttpServletRequest req, HttpServletResponse res, Map<String, String> wMap) throws Exception {
		StoreLogic slogic = new StoreLogic(wMap);
		Model view = new Model();
		HashMapBinder hmb = new HashMapBinder(req);
		int result = 0;
		Map<String, Object> pMap = new HashMap<String,Object>();
		
		hmb.bind(pMap);
		
		if("add".equals(wMap.get("Logicname"))) {
			logger.info("store/add성공");
			result = slogic.add(pMap);
			logger.info("db연동성공");
		}
		return view;
	}

}
