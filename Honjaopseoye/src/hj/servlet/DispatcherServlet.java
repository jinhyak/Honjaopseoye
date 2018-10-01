package hj.servlet;

import java.io.IOException;
import java.net.URLDecoder;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hj.common.ControllerForm;
import hj.common.HashMapBinder;
import hj.common.Model;
import hj.mapper.Mapping;
import org.apache.log4j.*;


public class DispatcherServlet extends HttpServlet{
	Logger logger = Logger.getLogger(this.getClass());
	public void service(HttpServletRequest req, HttpServletResponse res) throws IOException {
		Map<String, String> wMap = new HashMap<String, String>();//ï¿½ï¿½ï¿½ ï¿½ï¿½ ï¿½Å°ï¿½ï¿½Ö´Â¾ï¿½
		ControllerForm ctr = null;
		Map<String, Object> pMap = new HashMap<String,Object>();
		req.setCharacterEncoding("utf-8");
<<<<<<< HEAD
=======
		res.setContentType("text/html; charset=utf-8");
>>>>>>> refs/remotes/origin/20180928_í¬ì§„
		HashMapBinder hmb = new HashMapBinder(req);
		hmb.bind(pMap);
		Model view = null;
		Mapping Mapping = new Mapping();
<<<<<<< HEAD
//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ ÇÑ±Û¼³Á¤ euc-kr @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ ÄÁÆ®·Ñ·¯¸¦ Á¤ÇØÁÜ @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
=======
//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ ï¿½Ñ±Û¼ï¿½ï¿½ï¿½ euc-kr @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ ï¿½ï¿½Æ®ï¿½Ñ·ï¿½ï¿½ï¿½ ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
>>>>>>> refs/remotes/origin/20180928_í¬ì§„
		ctr = Mapping.mapping(req,wMap);
		if(ctr==null) {
			logger.info("ï¿½ï¿½Æ®ï¿½Ñ·ï¿½ï¿½ï¿½ ï¿½ï¿½ï¿½Ô´Ï´ï¿½");
			return;//ctrï¿½ï¿½ ï¿½ï¿½ï¿½Ï°ï¿½ï¿½ ï¿½ï¿½ï¿½Ï½ï¿½Å´(ï¿½Ş¼Òµï¿½ ï¿½ï¿½ï¿½ï¿½)
		}
//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ ctrï¿½ï¿½ ï¿½ï¿½ï¿½ï¿½ ï¿½Æ´Ò°ï¿½ï¿½ ï¿½Ş¼Òµï¿½ ï¿½ï¿½ï¿½ï¿½ @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
		else {
			try {
				logger.info("excuteì‹¤í–‰ì¤‘");
				view = ctr.excute(req, res, wMap);
			} catch (Exception e) {
				view = new Model();
<<<<<<< HEAD
				logger.info("excute¿À·ùÁß");
=======
				logger.info("excute!");
				view.setPath("../../main/main.jsp");
>>>>>>> refs/remotes/origin/20180928_í¬ì§„
				e.printStackTrace();
			}
		}
		if(view==null) {
			logger.info("viewê°€ ì—†ìŠµë‹ˆë‹¤.");
			view = new Model();
<<<<<<< HEAD
			//error page ·Î °¡°ÔÇØÁÜ
=======
			view.setPath("../../test/error.jsp");
			//error page ï¿½ï¿½ ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½
>>>>>>> refs/remotes/origin/20180928_í¬ì§„
		}
//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ ï¿½ï¿½ï¿½ï¿½ ï¿½ï¿½Ä°ï¿½ ï¿½ï¿½ï¿½ï¿½ ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
		else {
			if(view.isRedirect()) {
				logger.info("sendredirectë¡œ ë³´ë‚´ëŠ” ì¤‘ì…ë‹ˆë‹¤.");
				logger.info(view.getPath());
				res.sendRedirect(view.getPath());
			}
			else {
				logger.info("forwardë¡œ ë³´ë‚´ëŠ” ì¤‘ì…ë‹ˆë‹¤.");
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
