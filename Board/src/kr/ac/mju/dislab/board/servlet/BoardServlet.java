package kr.ac.mju.dislab.board.servlet;

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

//import org.apache.commons.lang3.StringUtils;

import kr.ac.mju.dislab.board.BoardAndUser;
import kr.ac.mju.dislab.board.PageResult;
import kr.ac.mju.dislab.board.Substance;
import kr.ac.mju.dislab.board.BoardDAO;
import kr.ac.mju.dislab.user.User;
import kr.ac.mju.dislab.user.FacebookUser;
import kr.ac.mju.dislab.user.UserDAO;
import kr.ac.mju.dislab.user.FacebookUserDAO;


/**
 * Servlet implementation class User
 */
@WebServlet("/board")
public class BoardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public BoardServlet() {
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

				PageResult<Substance> sub = BoardDAO.getPage(page, 10);
				request.setAttribute("sub", sub);
				request.setAttribute("page", page);

				ArrayList<BoardAndUser> baus = BoardDAO.joinboardandusers();
				request.setAttribute("baus", baus);

				actionUrl = "main.jsp";
			} else if (op.equals("show")) {
				Substance substance = BoardDAO.findById(id);
				request.setAttribute("substance", substance);
				
				HttpSession session = request.getSession(false);
				if(session.getAttribute("id") != null || session.getAttribute("fbid") != null) { 
					actionUrl = "board_show.jsp";
				}else {
					actionUrl = "login.jsp";
				}
			} else if (op.equals("update")) {
				Substance substance = BoardDAO.findById(id);
				request.setAttribute("substance", substance);
				request.setAttribute("method", "PUT");

				actionUrl = "board_write.jsp";
			} else if (op.equals("delete")) {
				ret = BoardDAO.remove(id);
				request.setAttribute("result", ret);

				if (ret) {
					request.setAttribute("msg", "게시글이 삭제되었습니다.");
					actionUrl = "board_success.jsp";
				} else {
					request.setAttribute("error", "게시글 삭제에 실패했습니다.");
					actionUrl = "error.jsp";
				}

			}  else if (op.equals("signup")) {
				HttpSession session = request.getSession(false);
				if(session.getAttribute("id") != null ) { // 세션에 저장된 값이 User Login할 때 저장된 값이면
					session.getAttribute("id");
				}else if(session.getAttribute("fbid") != null) { // 세션에 저장된 값이 FacebookUser Login할 때 저장된 값이면
					session.getAttribute("fbid");
				}

				request.setAttribute("method", "POST");
				request.setAttribute("substance", new Substance());

				actionUrl = "board_write.jsp";
			} else{
				request.setAttribute("error", "알 수 없는 명령입니다");
				actionUrl = "error.jsp";
			}
		} catch (SQLException | NamingException e) {
			request.setAttribute("error", e.getMessage());
			e.printStackTrace();
			actionUrl = "error.jsp";
		}

		RequestDispatcher dispatcher = request.getRequestDispatcher(actionUrl);
		dispatcher.forward(request,  response);

	}


	private boolean isRegisterMode(HttpServletRequest request) {
		String method = request.getParameter("_method");
		return method == null || method.equals("POST");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		boolean ret = false;
		String actionUrl;
		String msg;
		Substance substance = new Substance();

		request.setCharacterEncoding("utf-8");

		String subject = request.getParameter("subject");
		String content = request.getParameter("content");
		String category = request.getParameter("category");
		String spot = request.getParameter("spot");
		String image = request.getParameter("image");

		List<String> errorMsgs = new ArrayList<String>();

		if(subject != "" & content != "") {
			if(isRegisterMode(request)) {
				HttpSession session = request.getSession(false);
				if(session.getAttribute("id") != null ) { 
					try {
						int id = (int) session.getAttribute("id");
						User user = UserDAO.findByUserIdFromId(id);
						String userid = user.getUserid();
						substance.setUser_id(userid);

					} catch (NamingException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}	
				}else if(session.getAttribute("fbid") != null) {
					try {
						String fbid = (String)session.getAttribute("fbid");
						FacebookUser fbuser = FacebookUserDAO.findByUserIdFromId(fbid);
						String userid = fbuser.getUserid();
						substance.setUser_id(userid);
					} catch (NamingException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}	
				}

			}else {
				substance.setId(getIntFromParameter(request.getParameter("id"), -1));
			}
			if(subject == null || subject.trim().length() == 0) {
				errorMsgs.add("제목을 반드시 입력해주세요.");
			}
			if(content == null || content.trim().length() == 0) {
				errorMsgs.add("내용을 반드시 입력해주세요.");
			}
			substance.setSubject(subject);
			substance.setContent(content);
		} 

		substance.setCategory(category);

		if(spot!=null){
			substance.setSpot(spot);
		}

		if(image!=null&&(!(image.equals("")))){
			substance.setImage(image);
		}else{
			substance.setImage("<img src=\"/Board/upload/firstback.jpg \" alt = \"사진\">");
		}


		try {
			if (isRegisterMode(request)) {
				ret = BoardDAO.create(substance);
				msg = "게시글 등록되었습니다.";
				actionUrl = "board_success.jsp";
			} else {
				ret = BoardDAO.update(substance);
				msg = "게시글 수정되었습니다.";
				actionUrl = "board_success.jsp";
			}
			if (ret != true) {
				errorMsgs.add("변경에 실패했습니다.");
				actionUrl = "error.jsp";
			} else {
				request.setAttribute("msg", msg);
				actionUrl = "board_success.jsp";

			}
		} catch (SQLException | NamingException e) {
			errorMsgs.add(e.getMessage());
			actionUrl = "error.jsp";
		}

		request.setAttribute("errorMsgs", errorMsgs);
		RequestDispatcher dispatcher = request.getRequestDispatcher(actionUrl);
		dispatcher.forward(request,  response);
	}
}
