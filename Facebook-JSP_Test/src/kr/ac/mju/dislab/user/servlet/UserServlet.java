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

import kr.ac.mju.dislab.user.*;

import org.apache.commons.lang3.StringUtils;


/**
 * Servlet implementation class User
 */

@WebServlet("/user")
public class UserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

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
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
				System.out.println(page);

				PageResult<User> users = UserDAO.getPage(page, 10);
				request.setAttribute("users", users);
				request.setAttribute("page", page);
				actionUrl = "index.jsp";
			} else if (op.equals("show")) {
				User user = UserDAO.findById(id);
				request.setAttribute("user", user);

				actionUrl = "show.jsp";
			} else if (op.equals("update")) {
				User user = UserDAO.findById(id);
				request.setAttribute("user", user);
				request.setAttribute("method", "PUT");

				actionUrl = "signup.jsp";
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
				request.setAttribute("method", "POST");
				request.setAttribute("user", new User());
				actionUrl = "signup.jsp";
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
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		boolean ret;
		String actionUrl="";
		User user = new User();

		request.setCharacterEncoding("utf-8");
		String email = request.getParameter("email");
		String userid = request.getParameter("userid");
		String pwd = request.getParameter("pwd");
		String pwd_confirm = request.getParameter("pwd_confirm");

		List<String> errorMsgs = new ArrayList<String>();

		// 회원가입 오류 메세지

		if (isRegisterMode(request)) {
			if(email != ""  && userid != "" && pwd != "" ) {
				if (pwd == null || pwd.length() < 5) {
					errorMsgs.add("비밀번호는 5자 이상 입력해주세요.");
				} else if (!pwd.equals(pwd_confirm)) {
					errorMsgs.add("비밀번호가 일치하지 않습니다.");
				}  else {
					user.setPwd(pwd);
				}
			}else {
				errorMsgs.add("비밀번호 공백");
			}
		} else {
			user.setId(getIntFromParameter(request.getParameter("id"), -1));
		}

		if (email == null || email.trim().length() == 0) {
			errorMsgs.add("Email 공백");
		}
		
		if (userid == null || userid.length() < 4) {
			errorMsgs.add("ID를 4자 이상 입력해주세요.");
		}
		
		user.setEmail(email);
		user.setUserid(userid);
	

		//		if(useremail.equals(email)) {
		//			errorMsgs.add("이미 등록된 Email입니다.");
		//		}
		

		String msg="";

		try {
			if (isRegisterMode(request)) {
				ret = UserDAO.create(user);
				msg = "<br>" + userid + "</br>" + "님의 사용자 정보가 등록되었습니다.";
				request.setAttribute("msg", msg);
				actionUrl = "success.jsp";
			} 
			//			else {
			//				ret = UserDAO.update(user);
			//				actionUrl = "success.jsp";
			//				msg = "<b>" + name + "</b>님의 사용자 정보가 수정되었습니다.";
			//			}
			//			if (ret != true) {
			//				errorMsgs.add("변경에 실패했습니다.");
			//				actionUrl = "error.jsp";
			//			} else {
			//				request.setAttribute("msg", msg);
			//				actionUrl = "success.jsp";
			//			}
		} catch (SQLException | NamingException e) {
			errorMsgs.add(e.getMessage());
			actionUrl = "error.jsp";
		}

		request.setAttribute("errorMsgs", errorMsgs);
		RequestDispatcher dispatcher = request.getRequestDispatcher(actionUrl);
		dispatcher.forward(request,  response);
	}
}
