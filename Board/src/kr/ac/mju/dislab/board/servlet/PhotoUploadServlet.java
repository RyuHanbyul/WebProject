package kr.ac.mju.dislab.board.servlet;

import java.io.File;
import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;


@WebServlet("/photoUpload")
public class PhotoUploadServlet extends HttpServlet{

	private static final long serialVersionUID = 1L;
	private String realFolder = ""; // 웹 어플리케이션상의 절대 경로
	// 파일이 업로드 되는 폴더를 지정한다.
	private String saveFolder = "upload";
	private String encType = "UTF-8"; // 엔코딩 타입
	private int maxSize = 5 * 1024 * 1024;// 최대 업로드될 파일크기 5MB
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		
		MultipartRequest multi = null;
		// 전송을 담당할 콤포넌트를 생성하고 파일을 전송한다.
		// 전송할 파일명을 가지고 있는 객체, 서버상의 절대경로 , 최대 업로드될 파일 크기
		ServletContext context = getServletContext();
		realFolder= context.getRealPath(saveFolder);
		
		request.setCharacterEncoding("utf-8");
		multi = new MultipartRequest(request, realFolder, maxSize, encType,
				new DefaultFileRenamePolicy());
		String filename = multi.getFilesystemName("Filedata");
			
		String call = multi.getParameter("callback_func");
		String filepath = "/Board/upload/"+filename;
		response.sendRedirect("http://localhost:8080/Board/board/popup/quick_photo/callback.html?callback_func="+call+"&bNewLine=true&sFileName="+filename+"&sFileURL="+filepath);
		
	}
}
