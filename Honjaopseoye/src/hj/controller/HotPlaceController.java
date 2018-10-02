package hj.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import hj.common.ControllerForm;
import hj.common.HashMapBinder;
import hj.common.Model;
import hj.logic.HotPlaceLogic;


public class HotPlaceController implements ControllerForm{
	Logger logger = Logger.getLogger(this.getClass());
	@Override
	public Model excute(HttpServletRequest req, HttpServletResponse res, Map<String, String> wMap) throws Exception {
		HotPlaceLogic hlogic = new HotPlaceLogic(wMap);
		Model view = new Model();
		HashMapBinder hmb = new HashMapBinder(req);
		Map<String,Object> rMap = null;
		String str = null;
		List<Map<String, Object>> list = null;
		Map<String, Object> pMap = new HashMap<String,Object>();
		
		hmb.bind(pMap);
		
		if("show".equals(wMap.get("Logicname"))) {
			logger.info("show/select 성공");
			rMap = hlogic.show(pMap);
			logger.info("db연동성공");
			req.setAttribute("result", rMap);
			view.setPath("../../hotplace/show/search_result.jsp");
			view.setRedirect(false);			
		}
		
		//여기서 로직의 어떤 기능을 실행할 것인지 분기함
		//리턴 타입은 model타입
		return view;
	}

}
