package hj.mapper;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;

import hj.common.ControllerForm;
import hj.controller.BoardController;
import hj.controller.GubunController;
import hj.controller.LogicController;
import hj.controller.MemberController;
import hj.controller.MessageController;
import hj.controller.ReplyController;
import hj.controller.TestController;

public class Mapping {
	Logger logger = Logger.getLogger(Mapping.class);
	public ControllerForm mapping(HttpServletRequest req,Map<String, String> wMap) {
//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@  URI와 Path를 받아와 업무별로 분할  @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
		String URI = req.getRequestURI(); 
		String Path = req.getContextPath(); 
		String command = URI.substring(Path.length());
		String[] commands = command.split("/");
		String Ctrname = null;
		String Logicname = null;
		String Daoname = null;
		ControllerForm ctr = null; 
		logger.info(command);
//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 위는 선언/아래는 초기화작업  @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@	
		Ctrname = commands[1];
		Logicname = commands[2];
		Daoname = commands[3].substring(0, commands[3].length()-5);//정해야함
		wMap.put("Ctrname", Ctrname);
		wMap.put("Logicname", Logicname);
		wMap.put("Daoname", Daoname);
//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 컨트롤러 나눠주고 리턴시킴 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
		if(4==commands.length) {
			logger.info("정상적인 맵핑");
			logger.info(Ctrname);
			logger.info(Logicname);
			logger.info(Daoname);
			
			if("board".equals(Ctrname)) {
				ctr = new BoardController();
			}
			else if("message".equals(Ctrname)) {
				ctr = new MessageController();
			}
			else if("reply".equals(Ctrname)) {
				ctr = new ReplyController();
			}
			else if("logic".equals(Ctrname)) {
				ctr = new LogicController();
			}
			else if("test".equals(Ctrname)) {
				ctr = new TestController();
			}
			else if("gubun".equals(Ctrname)) {
				ctr = new GubunController();
			}
			else if("member".equals(Ctrname)) {
				ctr = new MemberController();
			}
			else if("".equals(Ctrname)) {
				
			}
			else if("".equals(Ctrname)) {
				
			}
			else if("".equals(Ctrname)) {
				
			}
			else if("".equals(Ctrname)) {
				
			}
		}
		else {
			logger.info("URI요청 정보가 맞지 않습니다.");
		}
		return ctr;
	}

}
