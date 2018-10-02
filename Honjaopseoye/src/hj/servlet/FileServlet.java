package hj.servlet;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class FileServlet extends HttpServlet {
	
	Logger logger = Logger.getLogger(FileServlet.class);
	
	public void doService(HttpServletRequest req, HttpServletResponse res) 
			throws ServletException,IOException {
		
		logger.info("File Servlet이동");
		
		req.setCharacterEncoding("utf-8");
		//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 컨트롤러를 정해줌 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
				//ctr = Mapping.mapping(req,wMap);
		ServletContext cxt = getServletContext();
		String path = "C:\\Users\\517\\git\\Honjaopseoye\\Honjaopseoye\\WebContent\\boardList\\images";
		int maxsize = 1024 * 1024 * 100; // 파일의 용량
		String encoding = "UTF-8"; // 파일 이름의 글자 타입
		MultipartRequest multipartRequest = new MultipartRequest(req, path, maxsize, encoding, new DefaultFileRenamePolicy());
		String img_file = multipartRequest.getParameter("img_file"); // 이미지
		logger.info("file 저장완료");
		
	}
	
	public void doPost(HttpServletRequest req, HttpServletResponse res)
			throws ServletException,IOException {
		doService(req, res);
	}
	
	public void doGet(HttpServletRequest req, HttpServletResponse res) 
			throws ServletException,IOException {
		doService(req, res);
	}

}
