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

import kr.ac.mju.dislab.board.*;

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
		//HttpSession session=request.getSession();
		String op = request.getParameter("op");
		String actionUrl = "";
		boolean ret;
		
		int id = getIntFromParameter(request.getParameter("id"), -1);
		//int user_id = (int) session.getAttribute("id");
		if (op == null && id > 0) {
			op = "show";
		}
		
		try {
			if (op == null || op.equals("index")) {
				int page = getIntFromParameter(request.getParameter("page"), 1);
				
				PageResult<Substance> sub = BoardDAO.getPage(page, 10);
				request.setAttribute("sub", sub);
				request.setAttribute("page", page);
				actionUrl = "index_board.jsp";
			} else if (op.equals("show")) {
				Substance substance = BoardDAO.findById(id);
				request.setAttribute("substance", substance);

				actionUrl = "show_board.jsp";
			} else if (op.equals("update")) {
					Substance substance = BoardDAO.findById(id);
					substance.setContent(substance.getContent().replace("<br/>","\r\n"));
					request.setAttribute("substance", substance);
					request.setAttribute("method", "PUT");
				actionUrl = "write.jsp";
				
			} else if (op.equals("delete")) {
				ret = BoardDAO.remove(id);
				request.setAttribute("result", ret);
				
				if (ret) {
					request.setAttribute("msg", "게시글이 삭제되었습니다.");
					actionUrl = "success.jsp";
				} else {
					request.setAttribute("error", "게시글 삭제에 실패했습니다.");
					actionUrl = "error.jsp";
				}
					
			} else if (op.equals("signup")) {
				request.setAttribute("method", "POST");
				request.setAttribute("substance", new Substance());
				actionUrl = "write.jsp";
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
		HttpSession session=request.getSession();
		String actionUrl;
		//String msg;
		Substance substance = new Substance();

		request.setCharacterEncoding("utf-8");
		
		String user_id = request.getParameter("user_id");
		String subject = request.getParameter("subject");
		String content = request.getParameter("content");
		
		List<String> errorMsgs = new ArrayList<String>();
		
		if (isRegisterMode(request)) {
			if (subject == null || subject.trim().length() == 0) {
				errorMsgs.add("제목을 반드시 입력해주세요.");
			
				
			}
			if (content == null || content.trim().length() == 0) {
				errorMsgs.add("내용을 반드시 입력해주세요.");
			} 
		} else {
			substance.setId(getIntFromParameter(request.getParameter("id"), -1));
		}

		
		if (subject == null || subject.trim().length() == 0) {
			errorMsgs.add("제목을 반드시 입력해주세요.");
		
			
		}
		if (content == null || content.trim().length() == 0) {
			errorMsgs.add("내용을 반드시 입력해주세요.");
		}
		
		substance.setSubject(subject);
		content = content.replace("\r\n","<br/>");
		substance.setContent(content);
		substance.setUser_id(user_id);
		
		try {
			if (isRegisterMode(request)) {
				ret = BoardDAO.create(substance);
				//msg = "<b>" + name + "</b>님의 사용자 정보가 등록되었습니다.";
			} else {
				ret = BoardDAO.update(substance);
				//msg = "<b>" + name + "</b>님의 사용자 정보가 수정되었습니다.";
				actionUrl = "success.jsp";
			}
			if (ret != true) {
				errorMsgs.add("변경에 실패했습니다.");
				actionUrl = "error.jsp";
			} else {
			//	request.setAttribute("msg", msg);
				actionUrl = "success.jsp";
				
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
