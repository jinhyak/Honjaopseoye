package hj.servlet;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hj.common.ControllerForm;
import hj.common.HashMapBinder;
import hj.common.Model;
import hj.mapper.Mapping;
import org.apache.log4j.*;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;


public class DispatcherServlet extends HttpServlet{
	Logger logger = Logger.getLogger(this.getClass());
	public void service(HttpServletRequest req, HttpServletResponse res) throws IOException {
		Map<String, String> wMap = new HashMap<String, String>();//얘는 값 옮겨주는애
		ControllerForm ctr = null;
		Map<String, Object> pMap = new HashMap<String,Object>();
		req.setCharacterEncoding("utf-8");
		HashMapBinder hmb = new HashMapBinder(req);
		Model view = null;
		Mapping Mapping = new Mapping();
		hmb.bind(pMap);
/*	    ServletContext cxt = getServletContext();
	    logger.info("경로 : " + cxt);
	    String direc = cxt.getRealPath("/upload"); // 이 파일에 저장됨
	    String path = "C:\\Users\\512\\git\\Honjaopseoye\\Honjaopseoye\\WebContent\\boardList\\images";
	    logger.info("경로 : " + direc);
	    int maxsize = 1024 * 1024 * 100; // 파일의 용량
	    String encoding = "EUC-KR"; // 파일 이름의 글자 타입
	    MultipartRequest multipartRequest = new MultipartRequest(req, path, maxsize, encoding, new DefaultFileRenamePolicy());
	    String img_file = multipartRequest.getParameter("img_file"); // 이미지
*///@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 한글설정 euc-kr @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 컨트롤러를 정해줌 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
		ctr = Mapping.mapping(req,wMap);
		if(ctr==null) {
			logger.info("컨트롤러가 널입니다");
			return;//ctr이 널일경우 리턴시킴(메소드 종료)
		}
//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ ctr이 널이 아닐경우 메소드 맵핑 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
		else {
			try {
				logger.info("excute실행중");
				view = ctr.excute(req, res, wMap);
			} catch (Exception e) {
				view = new Model();
				logger.info("excute오류중");
				e.printStackTrace();
			}
		}
		if(view==null) {
			logger.info("view가 널입니다");
			view = new Model();
			//error page 로 가게해줌
		}
//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 보낼 방식과 보낼 페이지를 결정해줌 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
		else {
			if(view.isRedirect()) {
				logger.info("sendredirect로 보내는중이에요");
				logger.info(view.getPath());
				res.sendRedirect(view.getPath());
			}
			else {
				logger.info("forward로 보내는중이에요");
				RequestDispatcher request = req.getRequestDispatcher(view.getPath());
				try {
					logger.info(view.getPath());
					logger.info(request);
					request.forward(req, res);
				} catch (ServletException e) {
					e.printStackTrace();
				}
			}
		}
	}
}
