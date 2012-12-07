package kr.ac.mju.dislab.user.servlet;

import java.io.IOException;
import java.net.URL;
import java.net.URLEncoder;
import java.sql.SQLException;
import java.util.*;

import javax.naming.NamingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.ac.mju.dislab.board.BoardAndUser;
import kr.ac.mju.dislab.board.BoardDAO;
import kr.ac.mju.dislab.user.*;

/**
 * Servlet implementation class User
 */

@WebServlet("/fbuser")
public class FacebookUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public FacebookUserServlet() {
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
			op = "show";
		}

		try {
			if (op == null || op.equals("index")) {
				int page = getIntFromParameter(request.getParameter("page"), 1);

				HttpSession session = request.getSession(false);
				if (session != null)
					session.getAttribute("fbid");

				PageResult<FacebookUser> fbusers = FacebookUserDAO.getPage(
						page, 10);
				request.setAttribute("fbusers", fbusers);
				request.setAttribute("page", page);
				actionUrl = "fb_index.jsp";
			} else if (op.equals("show")) {
				FacebookUser fbuser = FacebookUserDAO.findById(id);
				request.setAttribute("fbuser", fbuser);

				actionUrl = "show.jsp";
			} else if (op.equals("mypage")) {
				HttpSession session = request.getSession(false);
				if (session != null)
					session.getAttribute("fbid");
				ArrayList<BoardAndUser> baus = BoardDAO.joinboardandusers();
				request.setAttribute("baus", baus);
				FacebookUser fbuser = FacebookUserDAO.findById(id);
				request.setAttribute("fbuser", fbuser);
				request.setAttribute("method", "PUT");
				
				actionUrl = "fb_mypage.jsp";
			} else if (op.equals("update")) {
				HttpSession session = request.getSession(false);
				if (session != null) {
					String fbid = (String) session.getAttribute("fbid");
					FacebookUser fbuser = FacebookUserDAO.findByFbId(fbid);
					request.setAttribute("fbuser", fbuser);
				}
				request.setAttribute("method", "PUT");
				actionUrl = "fb_signup.jsp";
			} else if (op.equals("delete")) {
				ret = FacebookUserDAO.remove(id);
				request.setAttribute("result", ret);

				if (ret) {
					request.setAttribute("msg", "사용자 정보가 삭제되었습니다.");
					actionUrl = "success.jsp";
				} else {
					request.setAttribute("error", "사용자 정보 삭제에 실패했습니다.");
					actionUrl = "error.jsp";
				}

			} else if (op.equals("signup")) {
				request.setAttribute("method", "POST");
				request.setAttribute("fbuser", new FacebookUser());
				actionUrl = "fb_signup.jsp";
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

	private boolean isRegisterMode(HttpServletRequest request) {
		String method = request.getParameter("_method");
		return method == null || method.equals("POST");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		boolean ret;
		String actionUrl = "";
		FacebookUser fbuser = new FacebookUser();

		request.setCharacterEncoding("utf-8");
		String userid = request.getParameter("userid");
		String pwd = request.getParameter("pwd");
		String pwd_confirm = request.getParameter("pwd_confirm");
		String fbid = request.getParameter("fbid");
		String photoUrl = request.getParameter("photoUrl");

		List<String> errorMsgs = new ArrayList<String>();

		// 회원가입 오류 메세지

		if (userid != "" && pwd != "" && pwd_confirm != "") {
			if (isRegisterMode(request)) {
				if (userid == null || userid.trim().length() < 4) {
					errorMsgs.add("ID를 4글자 이상 입력해 주세요.");
				} else {
					fbuser.setUserid(userid);
				}
			} else {
				fbuser.setId(getIntFromParameter(request.getParameter("id"), -1));
			}
			if (pwd == null || pwd.length() < 5) {
				errorMsgs.add("비밀번호는 5자 이상 입력해주세요.");
			} else if (!pwd.equals(pwd_confirm)) {
				errorMsgs.add("비밀번호가 일치하지 않습니다.");
			} else {
				fbuser.setPwd(pwd);
			}
		} else {
			if (isRegisterMode(request)) {
				if (userid == null || userid.trim().length() < 4) {
					errorMsgs.add("ID를 4글자 이상 입력해 주세요.");
				} else {
					fbuser.setUserid(userid);
				}
			} else {
				fbuser.setId(getIntFromParameter(request.getParameter("id"), -1));
			}
			if (pwd == null || pwd.length() < 5) {
				errorMsgs.add("비밀번호는 5자 이상 입력해주세요.");
			} else if (!pwd.equals(pwd_confirm)) {
				errorMsgs.add("비밀번호가 일치하지 않습니다.");
			} else {
				fbuser.setPwd(pwd);
			}
		}
		fbuser.setfbId(fbid);


		try {
			URL url = new URL(photoUrl);
			String encodedurl = URLEncoder.encode(url.toString(), "UTF-8");
			fbuser.setPhotoUrl(encodedurl);
		} catch (Exception e) {
			errorMsgs.add(e.getMessage());
		}

		String msg = "";

		try {
			if (isRegisterMode(request)) {
				ret = FacebookUserDAO.create(fbuser);
				msg = "<br>" + userid + "</br>" + "님의 사용자 정보가 등록되었습니다.";
				request.setAttribute("msg", msg);
				actionUrl = "success.jsp";
			} else {
				ret = FacebookUserDAO.update(fbuser);
				actionUrl = "success.jsp";
				msg = "사용자 정보가 수정되었습니다.";
			}
			if (ret != true) {
				errorMsgs.add("변경에 실패했습니다.");
				actionUrl = "error.jsp";
			} else {
				request.setAttribute("msg", msg);
				actionUrl = "success.jsp";
			}
		} catch (SQLException | NamingException e) {
			errorMsgs.add(e.getMessage());
			actionUrl = "error.jsp";
		}

		request.setAttribute("fbid", fbid);
		request.setAttribute("errorMsgs", errorMsgs);
		RequestDispatcher dispatcher = request.getRequestDispatcher(actionUrl);
		dispatcher.forward(request, response);
	}
}
