package hj.servlet;

import java.io.IOException;
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
		HashMapBinder hmb = new HashMapBinder(req);
		hmb.bind(pMap);
		System.out.println();
		Model view = null;
		Mapping Mapping = new Mapping();
//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ �ѱۼ��� euc-kr @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
		req.setCharacterEncoding("utf-8");
//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ ��Ʈ�ѷ��� ������ @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
		ctr = Mapping.mapping(req,wMap);
		if(ctr==null) {
			logger.info("��Ʈ�ѷ��� ���Դϴ�");
			return;//ctr�� ���ϰ�� ���Ͻ�Ŵ(�޼ҵ� ����)
		}
//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ ctr�� ���� �ƴҰ�� �޼ҵ� ���� @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
		else {
			try {
				logger.info("excute������");
				view = ctr.excute(req, res, wMap);
			} catch (Exception e) {
				logger.info("excute������");
				e.printStackTrace();
			}
		}
		if(view==null) {
			logger.info("view�� ���Դϴ�");
			view = new Model();
			return;//view�� ���ϰ�� ���Ͻ�Ŵ(�޼ҵ�����)
		}
//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ ���� ��İ� ���� �������� �������� @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
		else {
			if(view.isRedirect()) {
				logger.info("sendredirect�� ���������̿���");
				logger.info(view.getPath());
				res.sendRedirect(view.getPath());
			}
			else {
				logger.info("forward�� ���������̿���");
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
