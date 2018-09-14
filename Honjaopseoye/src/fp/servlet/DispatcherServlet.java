package fp.servlet;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.logging.Logger;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hj.common.ControllerForm;
import hj.common.HashMapBinder;
import hj.common.Model;
import hj.mapper.Mapping;


@SuppressWarnings("serial")
public class DispatcherServlet extends HttpServlet{
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
		req.setCharacterEncoding("euc-kr");
//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ ��Ʈ�ѷ��� ������ @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
		ctr = Mapping.mapping(req,wMap);
		if(ctr==null) {
			System.out.println("controller�� null�Դϴ�");
			return;//ctr�� ���ϰ�� ���Ͻ�Ŵ(�޼ҵ� ����)
		}
//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ ctr�� ���� �ƴҰ�� �޼ҵ� ���� @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
		else {
			try {
				view = ctr.excute(req, res, wMap);
			} catch (Exception e) {
				e.printStackTrace();
				Logger.getLogger("�� �����Դϴ�");
			}
		}
		if(view==null) {
			System.out.println("view�� null�Դϴ�.");
			view = new Model();
			return;//view�� ���ϰ�� ���Ͻ�Ŵ(�޼ҵ�����)
		}
//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ ���� ��İ� ���� �������� �������� @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
		else {
			if(view.isRedirect()) {
				res.sendRedirect(view.getPath());
			}
			else {
				RequestDispatcher request = req.getRequestDispatcher(view.getPath());
				try {
					request.forward(req, res);
				} catch (ServletException e) {
					e.printStackTrace();
				}
			}
		}
	}
}
