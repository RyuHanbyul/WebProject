package kr.ac.mju.dislab.board;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Vector;

import javax.naming.*;
import javax.sql.*;

import kr.ac.mju.dislab.user.*;

public class BoardDAO {
	public static DataSource getDataSource() throws NamingException {
		Context initCtx = null;
		Context envCtx = null;

		// Obtain our environment naming context
		initCtx = new InitialContext();
		envCtx = (Context) initCtx.lookup("java:comp/env");

		// Look up our data source
		return (DataSource) envCtx.lookup("jdbc/WebDB");
	}
	
	public static PageResult<Substance> getPage(int page, int numItemsInPage) 
			throws SQLException, NamingException {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;		

		if (page <= 0) {
			page = 1;
		}
		
		DataSource ds = getDataSource();
		PageResult<Substance> result = new PageResult<Substance>(numItemsInPage, page);
		
		
		int startPos = (page - 1) * numItemsInPage;
		
		try {
			conn = ds.getConnection();
			stmt = conn.createStatement();
			
			// users 테이블: user 수 페이지수 개산
	 		rs = stmt.executeQuery("SELECT COUNT(*) FROM boards");
			rs.next();
			
			result.setNumItems(rs.getInt(1));
			
			rs.close();
			rs = null;
			stmt.close();
			stmt = null;
			
	 		// users 테이블 SELECT
			stmt = conn.createStatement();
			rs = stmt.executeQuery("SELECT * FROM boards ORDER BY id DESC LIMIT " + startPos + ", " + numItemsInPage);
			
			while(rs.next()) {
				result.getList().add(new Substance(rs.getInt("id"),
						rs.getString("user_id"),
						rs.getString("category"),
						rs.getString("subject"),
						rs.getString("content"),
						rs.getString("spot"),
						rs.getString("image"),
						rs.getString("created_at")
					));
			}
		} finally {
			// 무슨 일이 있어도 리소스를 제대로 종료
			if (rs != null) try{rs.close();} catch(SQLException e) {}
			if (stmt != null) try{stmt.close();} catch(SQLException e) {}
			if (conn != null) try{conn.close();} catch(SQLException e) {}
		}
		
		return result;		
	}
	
	public static Substance findById(int id) throws NamingException, SQLException{
		Substance substance = null;
		
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		DataSource ds = getDataSource();
		
		try {
			conn = ds.getConnection();

			// 질의 준비
			stmt = conn.prepareStatement("SELECT * FROM boards WHERE id = ?");
			stmt.setInt(1, id);
			
			// 수행
			rs = stmt.executeQuery();
			
			if (rs.next()) {
				substance = new Substance(rs.getInt("id"),
						rs.getString("user_id"),
						rs.getString("category"),
						rs.getString("subject"),
						rs.getString("content"),
						rs.getString("spot"),
						rs.getString("image"),
						rs.getString("created_at"));
			}		
		} finally {
			// 무슨 일이 있어도 리소스를 제대로 종료
			if (rs != null) try{rs.close();} catch(SQLException e) {}
			if (stmt != null) try{stmt.close();} catch(SQLException e) {}
			if (conn != null) try{conn.close();} catch(SQLException e) {}
		}
		
		return substance;
	}
	
	public static boolean create(Substance substance) throws SQLException, NamingException {
		int result;
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		DataSource ds = getDataSource();
		
		try {
			conn = ds.getConnection();

			// 질의 준비
			stmt = conn.prepareStatement(
					"INSERT INTO boards(user_id, category, subject, content, spot, image) " +
					"VALUES(?, ?,?,?,?,?)"
					);
			stmt.setString(1,  substance.getUser_id());
			stmt.setString(2,  substance.getCategory());
			stmt.setString(3,  substance.getSubject());
			stmt.setString(4,  substance.getContent());
			stmt.setString(5, substance.getSpot());
			stmt.setString(6, substance.getImage());
		
			// 수행
			result = stmt.executeUpdate();
		} finally {
			// 무슨 일이 있어도 리소스를 제대로 종료
			if (rs != null) try{rs.close();} catch(SQLException e) {}
			if (stmt != null) try{stmt.close();} catch(SQLException e) {}
			if (conn != null) try{conn.close();} catch(SQLException e) {}
		}
		
		return (result == 1);
	}
	
	public static boolean update(Substance substance) throws SQLException, NamingException {
		int result;
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		if(substance.getSubject().equals("")||substance.getContent().equals("")){
			return false;
		}
		DataSource ds = getDataSource();
		
		try {
			conn = ds.getConnection();

			// 질의 준비
			stmt = conn.prepareStatement(
					"UPDATE boards " +
					"SET category=?, subject=?, content=?, spot=?, image=? " +
					"WHERE id=?"
					);
			stmt.setString(1,  substance.getCategory());
			stmt.setString(2,  substance.getSubject());
			stmt.setString(3,  substance.getContent());
			stmt.setString(4,  substance.getSpot());
			stmt.setString(5,  substance.getImage());
			stmt.setInt(6,  substance.getId());
			// 수행
			result = stmt.executeUpdate();
		} finally {
			// 무슨 일이 있어도 리소스를 제대로 종료
			if (rs != null) try{rs.close();} catch(SQLException e) {}
			if (stmt != null) try{stmt.close();} catch(SQLException e) {}
			if (conn != null) try{conn.close();} catch(SQLException e) {}
		}
		
		return (result == 1);		
	}
	
	public static boolean remove(int id) throws NamingException, SQLException {
		int result;
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		DataSource ds = getDataSource();
		
		try {
			conn = ds.getConnection();

			// 질의 준비
			stmt = conn.prepareStatement("DELETE FROM boards WHERE id=?");
			stmt.setInt(1,  id);
			
			// 수행
			result = stmt.executeUpdate();
		} finally {
			// 무슨 일이 있어도 리소스를 제대로 종료
			if (rs != null) try{rs.close();} catch(SQLException e) {}
			if (stmt != null) try{stmt.close();} catch(SQLException e) {}
			if (conn != null) try{conn.close();} catch(SQLException e) {}
		}
		
		return (result == 1);		
	}
	
	public static ArrayList<BoardAndUser> joinboardandusers() throws NamingException, SQLException{
		BoardAndUser boardAndUser = null;
		
		ArrayList<BoardAndUser> boardAndUsers = new ArrayList<BoardAndUser>();
		
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		
		DataSource ds = getDataSource();
		
		try {
			conn = ds.getConnection();

			// 질의 준비
			stmt = conn.prepareStatement("SELECT * FROM boards, users where boards.user_id = users.userid ORDER BY boards.created_at DESC;");
			// 수행
			rs = stmt.executeQuery();
		
			while(rs.next()) {
				
				boardAndUser = new BoardAndUser(
							new Substance(
									rs.getInt("id"), 
									rs.getString("user_id"),
									rs.getString("category"), 
									rs.getString("subject"), 
									rs.getString("content"),
									rs.getString("spot"), 
									rs.getString("image"), 
									rs.getString("created_at")),
							new User(
									rs.getInt("id"),
									rs.getString("email"),
									rs.getString("userid"),
									rs.getString("pwd"),
									rs.getString("photoUrl"))
							);
				boardAndUsers.add(boardAndUser);
			}		
		} finally {
			// 무슨 일이 있어도 리소스를 제대로 종료
			if (rs != null) try{rs.close();} catch(SQLException e) {}
			if (stmt != null) try{stmt.close();} catch(SQLException e) {}
			if (conn != null) try{conn.close();} catch(SQLException e) {}
		}
		System.out.println("lkjlkj");
		System.out.println(boardAndUsers.size());
		return boardAndUsers;
	}
	public static ArrayList<BoardAndUser> findByCategory(String category) throws NamingException, SQLException{
		BoardAndUser boardAndUser = null;
		
		ArrayList<BoardAndUser> boardAndUsers = new ArrayList<BoardAndUser>();
		
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		
		DataSource ds = getDataSource();
		
		try {
			conn = ds.getConnection();

			// 질의 준비
			stmt = conn.prepareStatement("SELECT * FROM boards, users where boards.user_id = users.userid ORDER BY boards.created_at DESC;");
			// 수행
			rs = stmt.executeQuery();
		
			while(rs.next()) {
				
				boardAndUser = new BoardAndUser(
							new Substance(
									rs.getInt("id"), 
									rs.getString("user_id"),
									rs.getString("category"), 
									rs.getString("subject"), 
									rs.getString("content"),
									rs.getString("spot"), 
									rs.getString("image"), 
									rs.getString("created_at")),
							new User(
									rs.getInt("id"),
									rs.getString("email"),
									rs.getString("userid"),
									rs.getString("pwd"),
									rs.getString("photoUrl"))
							);
				boardAndUsers.add(boardAndUser);
			}		
		} finally {
			// 무슨 일이 있어도 리소스를 제대로 종료
			if (rs != null) try{rs.close();} catch(SQLException e) {}
			if (stmt != null) try{stmt.close();} catch(SQLException e) {}
			if (conn != null) try{conn.close();} catch(SQLException e) {}
		}
		System.out.println("lkjlkj");
		System.out.println(boardAndUsers.size());
		return boardAndUsers;
	}
}
