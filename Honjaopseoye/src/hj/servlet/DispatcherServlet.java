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
		Map<String, String> wMap = new HashMap<String, String>();//��� �� �Ű��ִ¾�
		ControllerForm ctr = null;
		Map<String, Object> pMap = new HashMap<String,Object>();
		req.setCharacterEncoding("utf-8");
		res.setContentType("text/html; charset=utf-8");
		HashMapBinder hmb = new HashMapBinder(req);
		hmb.bind(pMap);
		System.out.println();
		Model view = null;
		Mapping Mapping = new Mapping();
//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ �ѱۼ��� euc-kr @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ ��Ʈ�ѷ��� ������ @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
		ctr = Mapping.mapping(req,wMap);
		if(ctr==null) {
			logger.info("��Ʈ�ѷ��� ���Դϴ�");
			return;//ctr�� ���ϰ�� ���Ͻ�Ŵ(�޼ҵ� ����)
		}
//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ ctr�� ���� �ƴҰ�� �޼ҵ� ���� @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
		else {
			try {
				logger.info("excute실행중");
				view = ctr.excute(req, res, wMap);
			} catch (Exception e) {
				view = new Model();
				logger.info("excute!");
				view.setPath("../../main/main.jsp");
				e.printStackTrace();
			}
		}
		if(view==null) {
			logger.info("view가 없습니다.");
			view = new Model();
			view.setPath("../../test/error.jsp");
			//error page �� ��������
		}
//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ ���� ��İ� ���� �������� �������� @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
		else {
			if(view.isRedirect()) {
				logger.info("sendredirect로 보내는 중입니다.");
				logger.info(view.getPath());
				res.sendRedirect(view.getPath());
			}
			else {
				logger.info("forward로 보내는 중입니다.");
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
