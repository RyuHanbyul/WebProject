package kr.ac.mju.dislab.user.servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.*;

import javax.naming.NamingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.catalina.Session;

import kr.ac.mju.dislab.board.BoardAndUser;
import kr.ac.mju.dislab.board.BoardDAO;
import kr.ac.mju.dislab.user.*;

import org.apache.commons.lang3.StringUtils;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

/**
 * Servlet implementation class User
 */

@WebServlet("/user")
public class UserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private String realFolder = ""; // 웹 어플리케이션상의 절대 경로
	// 파일이 업로드 되는 폴더를 지정한다.
	private String saveFolder = "upload";
	private String encType = "UTF-8"; // 엔코딩 타입
	private int maxSize = 5 * 1024 * 1024;// 최대 업로드될 파일크기 5MB

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UserServlet() {
		super();
	}

	private int getIntFromParameter(String str, int defaultValue) {
		int id;

		try {
			id = Integer.parseInt(str);
		} catch (Exception e) {
			id = defaultValue;
		}
		return id;
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String op = request.getParameter("op");
		String actionUrl = "";
		boolean ret;
		int id = getIntFromParameter(request.getParameter("id"), -1);

		if (op == null && id > 0) {
			op = "main.jsp";
		}

		try {
			if (op == null || op.equals("index")) {
				int page = getIntFromParameter(request.getParameter("page"), 1);

				HttpSession session = request.getSession(false);
				if (session != null)
					session.getAttribute("id");

				PageResult<User> users = UserDAO.getPage(page, 10);
				request.setAttribute("users", users);
				request.setAttribute("page", page);
				actionUrl = "user_index.jsp";
			} else if (op.equals("show")) {
				User user = UserDAO.findById(id);
				request.setAttribute("user", user);

				actionUrl = "user_show.jsp";
			} else if (op.equals("mypage")) {
				HttpSession session = request.getSession(false);
				if (session != null)
					session.getAttribute("id");
				ArrayList<BoardAndUser> baus = BoardDAO.joinboardandusers();
				request.setAttribute("baus", baus);
				User user = UserDAO.findById(id);
				request.setAttribute("user", user);
				request.setAttribute("method", "PUT");

				actionUrl = "mypage.jsp";
			} else if (op.equals("admin")) {
				HttpSession session = request.getSession(false);
				if (session != null)
					session.getAttribute("id");

				actionUrl = "admin.jsp";
			} else if (op.equals("update")) {
				HttpSession session = request.getSession(false);
				if (session != null)
					session.getAttribute("id");

				User user = UserDAO.findById(id);
				request.setAttribute("user", user);
				request.setAttribute("method", "PUT");

				actionUrl = "user_signup.jsp";
			} else if (op.equals("delete")) {
				ret = UserDAO.remove(id);
				request.setAttribute("result", ret);

				if (ret) {
					request.setAttribute("msg", "사용자 정보가 삭제되었습니다.");
					actionUrl = "success.jsp";
				} else {
					request.setAttribute("error", "사용자 정보 삭제에 실패했습니다.");
					actionUrl = "error.jsp";
				}

			} else if (op.equals("signup")) {
				request.setAttribute("user", new User());
				request.setAttribute("method", "POST");
				actionUrl = "user_signup.jsp";
			} else {
				request.setAttribute("error", "알 수 없는 명령입니다");
				actionUrl = "error.jsp";
			}
		} catch (SQLException | NamingException e) {
			request.setAttribute("error", e.getMessage());
			e.printStackTrace();
			actionUrl = "error.jsp";
		}

		RequestDispatcher dispatcher = request.getRequestDispatcher(actionUrl);
		dispatcher.forward(request, response);
	}

	private boolean isRegisterMode(String method) {
		return method == null || method.equals("POST");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		HttpSession httpSession = request.getSession();
		boolean ret;
		String actionUrl = "";
		User user = new User();

		String filename = null;
		String filePath = null;
		MultipartRequest multi = null;
		// 전송을 담당할 콤포넌트를 생성하고 파일을 전송한다.
		// 전송할 파일명을 가지고 있는 객체, 서버상의 절대경로 , 최대 업로드될 파일 크기
		ServletContext context = getServletContext();
		// 현재 jsp 페이지의 웹 어플리케이션 상의 절대 경로를 구한다
		realFolder = context.getRealPath(saveFolder);
		request.setCharacterEncoding("utf-8");
		multi = new MultipartRequest(request, realFolder, maxSize, encType,
				new DefaultFileRenamePolicy());

		String id = multi.getParameter("id");
		String email = multi.getParameter("email");
		String pwd = multi.getParameter("pwd");
		String pwd_confirm = multi.getParameter("pwd_confirm");
		String userid = multi.getParameter("userid");
		String photoUrl = multi.getFilesystemName("photoUrl");
		String method = multi.getParameter("op_method");

		List<String> errorMsgs = new ArrayList<String>();

		// 회원가입 오류 메세지

		if (email != "" && userid != "" && pwd != "" && pwd_confirm != "") {
			if (isRegisterMode(method)) {

				if (email != null && email.trim().length() != 0) {
					user.setEmail(email);
				} else {
					errorMsgs.add("이메일을 입력해 주세요.");
				}
				if (userid == null || userid.trim().length() < 4) {
					errorMsgs.add("ID는 4자 이상으로 입력해주세요.");
				} else {
					System.out.println("in");
					user.setUserid(userid);
				}
			} else {
				user.setId(getIntFromParameter(id, -1));
			}

			if (pwd == null || pwd.length() < 5) {
				errorMsgs.add("비밀번호는 5자 이상 입력해주세요.");
			} else if (!pwd.equals(pwd_confirm)) {
				errorMsgs.add("비밀번호가 일치하지 않습니다.");
			} else {
				user.setPwd(pwd);
			}
		}

		user.setEmail(email);

		if (photoUrl != null) {
			user.setPhotoUrl(photoUrl);
		} else {
			user.setPhotoUrl("firstid.jpg");
		}

		String msg = "";

		try {
			if (isRegisterMode(method)) {
				ret = UserDAO.create(user);
				msg = "<br>사용자 정보가 등록되었습니다.";
				request.setAttribute("msg", msg);
				actionUrl = "success.jsp";
			} else {
				ret = UserDAO.update(user);
				actionUrl = "success.jsp";
				msg = "<b>사용자 정보가 수정되었습니다.";
			}

			if (ret != true) {
				errorMsgs.add("변경에 실패했습니다.");
				actionUrl = "error.jsp";
			} else {
				request.setAttribute("msg", msg);
				actionUrl = "success.jsp";
			}

		} catch (SQLException | NamingException e) {
			e.printStackTrace();
			errorMsgs.add(e.getMessage());
			actionUrl = "error.jsp";
		}
		request.setAttribute("photoUrl", filename);
		request.setAttribute("errorMsgs", errorMsgs);
		RequestDispatcher dispatcher = request.getRequestDispatcher(actionUrl);
		dispatcher.forward(request, response);
	}
}
