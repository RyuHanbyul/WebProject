package kr.ac.mju.dislab.user.servlet;

import java.io.IOException;
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

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		HttpSession session=request.getSession(false);

		String op = request.getParameter("op");

		String actionUrl="";
		if (op == null || op.equals("index")){

			actionUrl="login.jsp";
		}
		else if (op.equals("logout")){

			session.removeAttribute("email");
			session.invalidate();
			request.removeAttribute("login_email");
			actionUrl="logout.jsp";
		}

		RequestDispatcher dispatcher = request.getRequestDispatcher(actionUrl);
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession(false);

		String email = request.getParameter("email");
		String pwd = request.getParameter("pwd");

//		User user = new User();

		String actionUrl = "";

		// dao 단에 email 넣어서 user 찾아옴
		if(email != null && email != "" && pwd != null && pwd != "") {
			try {

				User userinfo=UserDAO.findByEmail(email);

				if (userinfo == null) {
					request.setAttribute("msg", "Email 오류!");

					actionUrl="login.jsp";

				} else if (userinfo != null) {
					if(userinfo.getPwd().equals(pwd) && userinfo.getEmail().equals(email)) {
						session.setAttribute("login_email", email);
						request.setAttribute("msg", email + "님 방문을 환영합니다!");
						actionUrl="login.jsp";
					}else {
						request.setAttribute("msg", "pwd 오류!");
						actionUrl="login.jsp";
					}
				}

			} catch (SQLException | NamingException e) {
				request.setAttribute("error", e.getMessage());
				e.printStackTrace();
				actionUrl = "error.jsp";
			}
		}else if(email=="" && pwd==""){
			request.setAttribute("msg", "email과 pwd를 입력해주세요!");
			actionUrl="login.jsp";
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(actionUrl);
		dispatcher.forward(request,  response);
	}
}
