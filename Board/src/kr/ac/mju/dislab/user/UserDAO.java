package kr.ac.mju.dislab.user;

import java.sql.*;

import javax.naming.*;
import javax.sql.*;

import kr.ac.mju.dislab.user.*;


public class UserDAO {
	public static DataSource getDataSource() throws NamingException {
		Context initCtx = null;
		Context envCtx = null;

		// Obtain our environment naming context
		initCtx = new InitialContext();
		envCtx = (Context) initCtx.lookup("java:comp/env");

		// Look up our data source
		return (DataSource) envCtx.lookup("jdbc/WebDB");
	}
	
	
	
	public static User findById(int id) throws NamingException, SQLException{
		User user = null;
		
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		DataSource ds = getDataSource();
		
		try {
			conn = ds.getConnection();

			// 질의 준비
			stmt = conn.prepareStatement("SELECT * FROM users WHERE uid = ?");
			stmt.setInt(1, id);
			
			// 수행
			rs = stmt.executeQuery();

			if (rs.next()) {
				user = new User(rs.getInt("uid"),
						rs.getString("email"),
						rs.getString("u_userid"),
						rs.getString("pwd"),
						rs.getString("photoUrl"));
			}	
		} finally {
			// 무슨 일이 있어도 리소스를 제대로 종료
			if (rs != null) try{rs.close();} catch(SQLException e) {}
			if (stmt != null) try{stmt.close();} catch(SQLException e) {}
			if (conn != null) try{conn.close();} catch(SQLException e) {}
		}
		
		return user;
	}
	
	public static User findByEmail(String email) throws NamingException, SQLException{
		User userinfo=null;
		
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
	
		
		DataSource ds = getDataSource();
		
		
		try {
			conn = ds.getConnection();
			// 질의 준비
		
				stmt = conn.prepareStatement("SELECT * FROM users WHERE email = ?");
				stmt.setString(1, email);
				
				// 수행
				rs = stmt.executeQuery();
				
				if(rs.next()) {
					userinfo = new User(rs.getInt("uid"),
							rs.getString("email"),
							rs.getString("u_userid"),
							rs.getString("pwd"),
							rs.getString("photoUrl"));
				}
				
		} finally {
			// 무슨 일이 있어도 리소스를 제대로 종료
			if (rs != null) try{rs.close();} catch(SQLException e) {}
			if (stmt != null) try{stmt.close();} catch(SQLException e) {}
			if (conn != null) try{conn.close();} catch(SQLException e) {}
		}
		
		return userinfo;
	}
	
	public static PageResult<User> getPage(int page, int numItemsInPage) throws SQLException, NamingException {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;		

		if ( page <= 0 ) {
			page = 1;
		}
		
		DataSource ds = getDataSource();
		PageResult<User> result = new PageResult<User>(numItemsInPage, page);
		
		
		int startPos = (page - 1) * numItemsInPage;
		
		try {
			conn = ds.getConnection();
			stmt = conn.createStatement();
			
			// users 테이블: user 수 페이지수 개산
	 		rs = stmt.executeQuery("SELECT COUNT(*) FROM users");
			rs.next();
			
			result.setNumItems(rs.getInt(1));
			
			rs.close();
			rs = null;
			stmt.close();
			stmt = null;
			
	 		// users 테이블 SELECT
			stmt = conn.createStatement();
			rs = stmt.executeQuery("SELECT * FROM users ORDER BY uid LIMIT " + startPos + ", " + numItemsInPage);
			int i=0;
			while(rs.next()) {
				i++;
				result.getList().add(new User(rs.getInt("uid"),
						rs.getString("email"),
						rs.getString("u_userid"),
						rs.getString("pwd"),
						rs.getString("photoUrl")
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
	
	public static User findByUserIdFromId(int id) throws NamingException, SQLException{
		User userinfo=null;
		
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
	
		
		DataSource ds = getDataSource();
		
		
		try {
			conn = ds.getConnection();
			// 질의 준비
		
				stmt = conn.prepareStatement("SELECT u_userid FROM users WHERE uid = ?");
				stmt.setInt(1, id);
				
				// 수행
				rs = stmt.executeQuery();
				
				if(rs.next()) {
					userinfo = new User(
							rs.getString("u_userid"));
				}
				
		} finally {
			// 무슨 일이 있어도 리소스를 제대로 종료
			if (rs != null) try{rs.close();} catch(SQLException e) {}
			if (stmt != null) try{stmt.close();} catch(SQLException e) {}
			if (conn != null) try{conn.close();} catch(SQLException e) {}
		}
		
		return userinfo;
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
			stmt = conn.prepareStatement("DELETE FROM users WHERE uid=?");
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
	
	public static boolean create(User user) throws SQLException, NamingException {
		int result;
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		DataSource ds = getDataSource();
		
		try {
			conn = ds.getConnection();

			// 질의 준비
			stmt = conn.prepareStatement(
					"INSERT INTO users(uid, email, u_userid, pwd, photoUrl) " +
					"VALUES(?, ?, ?, ?, ?)"
					);
			stmt.setInt(1,  user.getId());
			stmt.setString(2,  user.getEmail());
			stmt.setString(3, user.getUserid());
			stmt.setString(4, user.getPwd());
			stmt.setString(5,  user.getPhotoUrl());
			
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
	
	public static boolean update(User user) throws SQLException, NamingException {
		int result;
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		DataSource ds = getDataSource();
		
		try {
			conn = ds.getConnection();

			// 질의 준비
			stmt = conn.prepareStatement(
					"UPDATE users " +
					"SET pwd=?, photoUrl=? "+
					"WHERE uid=?"
					);
			stmt.setString(1,  user.getPwd());
			stmt.setString(2,  user.getPhotoUrl());
			stmt.setInt(3,  user.getId());
			
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
}
