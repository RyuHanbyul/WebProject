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

import kr.ac.mju.dislab.user.FacebookUser;
import kr.ac.mju.dislab.user.FacebookUserDAO;

import com.restfb.types.User;


@WebServlet("/FBAuthServlet") 
public class FBAuthServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String code = request.getParameter("code"); 

		request.setCharacterEncoding("UTF-8");

		// facebook에서 전달받은 인증 code가 없을 경우
		if( code == null){			
			String oauthURL = Facebook.getOAuthURL();
			response.sendRedirect (oauthURL);
		}
		else{			
			Facebook facebook = Facebook.getInstance(code); 
			
			// 현재 페이스북 유저와 친구의 정보를 가져온다.
			User me = facebook.getCurrentUser();

			// request의 attribute로 담는다.
			request.setAttribute("me", me);
			request.setAttribute("facebook", facebook);
			
			
			// 페이스북 키 널이면 회원가입으로
			// 페이스북 키가 DB에 저장되어 있으면 로그인 창으로
			
			String fbid = me.getId();
			System.out.println(me.getId());
			String actionUrl="";
			
			try {
				FacebookUser fbuserinfo = FacebookUserDAO.findByFbId(fbid);
				if(fbuserinfo == null ) {
					System.out.println("페북 키 널임 가입으로 넘어가야 함");
					actionUrl = "fbuser?op=signup";
				}else {
					actionUrl = "fb_login.jsp";
				}
			}catch (SQLException | NamingException e) {
				request.setAttribute("error", e.getMessage());
				e.printStackTrace();
				actionUrl = "error.jsp";
			}
			
			RequestDispatcher view = request.getRequestDispatcher(actionUrl); // fbuser?op=signup
			view.forward(request, response);
			

			// View page 설정
//			RequestDispatcher view = request.getRequestDispatcher(fbuser?op=signup); // fbuser?op=signup
//			view.forward(request, response);
		}
	}
}
