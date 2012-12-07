package kr.ac.mju.dislab.user.servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.naming.NamingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.ac.mju.dislab.user.*;

/**
 * Servlet implementation class User
 */

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LoginServlet() {
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

		HttpSession session = request.getSession(false);

		String op = request.getParameter("op");
		String fbop = request.getParameter("fbop");

		String actionUrl = "";
		if (op == null || op.equals("index")) {

			actionUrl = "login.jsp";
		} else if (op.equals("logout")) {
			
			session.invalidate();
			actionUrl = "logout.jsp";
		}else if (fbop == null || fbop.equals("index")) {

			actionUrl = "login.jsp";
		} else if (fbop.equals("logout")) {

			session.invalidate();
			actionUrl = "logout.jsp";
		}

		RequestDispatcher dispatcher = request.getRequestDispatcher(actionUrl);
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);

		String email = request.getParameter("email");
		String pwd = request.getParameter("pwd");
		String userid = request.getParameter("userid");

		String actionUrl = "";

		// User의 Login & Login 오류 메세지
		if (email != null && email != "" && pwd != null && pwd != "") {
			try {

				User userinfo = UserDAO.findByEmail(email);

				if (userinfo == null) {
					request.setAttribute("msg", "가입하지 않은 Email입니다.");

					actionUrl = "login.jsp";

				} else if (userinfo != null) {
					if (userinfo.getPwd().equals(pwd)
							&& userinfo.getEmail().equals(email)) {
						session.setAttribute("id", userinfo.getId());
						request.setAttribute("msg", userinfo.getUserid() + "님 방문을 환영합니다!");
						System.out.println(userinfo.getUserid());
						actionUrl = "login.jsp";
					} else {
						request.setAttribute("msg", "pwd 오류!");
						actionUrl = "login.jsp";
					}
				}

			} catch (SQLException | NamingException e) {
				request.setAttribute("error", e.getMessage());
				e.printStackTrace();
				actionUrl = "error.jsp";
			}
		} else if (email == "" && pwd == "") {
			request.setAttribute("msg", "email과 pwd를 입력해주세요!");
			actionUrl = "login.jsp";
		} else if (pwd == "" ) {
			request.setAttribute("msg", "pwd를 입력해주세요!");
			actionUrl = "login.jsp";
		}

		// Facebook의 Login 오류메세지

		if (userid != null && userid != "" && pwd != null && pwd != "") {
			try {

				FacebookUser fbuserinfo = FacebookUserDAO.findByUserId(userid);
				if (fbuserinfo == null) {
					request.setAttribute("msg", "UserID 오류!");

					actionUrl = "fb_login.jsp";

				} else if (fbuserinfo != null) {
					if (fbuserinfo.getPwd().equals(pwd)
							&& fbuserinfo.getUserid().equals(userid)) {
						session.setAttribute("fbid", fbuserinfo.getfbId());
						session.setAttribute("fid", fbuserinfo.getId());
						request.setAttribute("msg", userid + "님 방문을 환영합니다!");
						actionUrl = "fb_login.jsp";
					} else {
						request.setAttribute("msg", "pwd 오류!");
						actionUrl = "fb_login.jsp";
					}
				}

			} catch (SQLException | NamingException e) {
				request.setAttribute("error", e.getMessage());
				e.printStackTrace();
				actionUrl = "error.jsp";
			}
		} else if (userid == "" && pwd == "") {
			request.setAttribute("msg", "UserID와 pwd를 입력해주세요!");
			actionUrl = "fb_login.jsp";
		}

		RequestDispatcher dispatcher = request.getRequestDispatcher(actionUrl);
		dispatcher.forward(request, response);
	}
}
