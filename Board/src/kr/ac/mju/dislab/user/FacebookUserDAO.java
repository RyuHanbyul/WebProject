package kr.ac.mju.dislab.user;

import java.sql.*;

import javax.naming.*;
import javax.sql.*;

import kr.ac.mju.dislab.user.*;


public class FacebookUserDAO {
	public static DataSource getDataSource() throws NamingException {
		Context initCtx = null;
		Context envCtx = null;

		// Obtain our environment naming context
		initCtx = new InitialContext();
		envCtx = (Context) initCtx.lookup("java:comp/env");

		// Look up our data source
		return (DataSource) envCtx.lookup("jdbc/WebDB");
	}
	
	public static PageResult<FacebookUser> getPage(int page, int numItemsInPage) throws SQLException, NamingException {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;		

		if ( page <= 0 ) {
			page = 1;
		}
		
		DataSource ds = getDataSource();
		PageResult<FacebookUser> result = new PageResult<FacebookUser>(numItemsInPage, page);
		
		
		int startPos = (page - 1) * numItemsInPage;
		
		try {
			conn = ds.getConnection();
			stmt = conn.createStatement();
			
			// users 테이블: user 수 페이지수 개산
	 		rs = stmt.executeQuery("SELECT COUNT(*) FROM fbusers");
			rs.next();
			
			result.setNumItems(rs.getInt(1));
			
			rs.close();
			rs = null;
			stmt.close();
			stmt = null;
			
	 		// users 테이블 SELECT
			stmt = conn.createStatement();
			rs = stmt.executeQuery("SELECT * FROM fbusers ORDER BY fid LIMIT " + startPos + ", " + numItemsInPage);
			int i=0;
			while(rs.next()) {
				i++;
				result.getList().add(new FacebookUser(rs.getInt("fid"),
						rs.getString("fb_id"),
						rs.getString("userid"),
						rs.getString("pwd"),
						rs.getString("photo_url")
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
	
	public static FacebookUser findById(int id) throws NamingException, SQLException{
		FacebookUser fbuser = null;
		
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		DataSource ds = getDataSource();
		
		try {
			conn = ds.getConnection();

			// 질의 준비
			stmt = conn.prepareStatement("SELECT * FROM fbusers WHERE fid = ?");
			stmt.setInt(1, id);
			
			// 수행
			rs = stmt.executeQuery();

			if (rs.next()) {
				fbuser = new FacebookUser(rs.getInt("fid"),
						rs.getString("fb_id"),
						rs.getString("userid"),
						rs.getString("pwd"),
						rs.getString("photo_url"));
			}	
		} finally {
			// 무슨 일이 있어도 리소스를 제대로 종료
			if (rs != null) try{rs.close();} catch(SQLException e) {}
			if (stmt != null) try{stmt.close();} catch(SQLException e) {}
			if (conn != null) try{conn.close();} catch(SQLException e) {}
		}
		
		return fbuser;
	}
	
	public static FacebookUser findByFbId(String fbid) throws NamingException, SQLException{
		FacebookUser userinfo=null;
		
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
	
		
		DataSource ds = getDataSource();
		conn = ds.getConnection();
		
		try {
			// 질의 준비
		
				stmt = conn.prepareStatement("SELECT * FROM fbusers WHERE fb_id = ?");
				stmt.setString(1, fbid);
				
				// 수행
				rs = stmt.executeQuery();
				
				if(rs.next()) {
					userinfo = new FacebookUser(rs.getInt("fid"),
							rs.getString("fb_id"),
							rs.getString("userid"),
							rs.getString("pwd"),
							rs.getString("photo_url"));
				}
				
		} finally {
			// 무슨 일이 있어도 리소스를 제대로 종료
			if (rs != null) try{rs.close();} catch(SQLException e) {}
			if (stmt != null) try{stmt.close();} catch(SQLException e) {}
			if (conn != null) try{conn.close();} catch(SQLException e) {}
		}
		
		return userinfo;
	}
	
	public static FacebookUser findByUserId(String userid) throws NamingException, SQLException{
		FacebookUser userinfo=null;
		
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
	
		
		DataSource ds = getDataSource();
		conn = ds.getConnection();
		
		try {
			// 질의 준비
		
				stmt = conn.prepareStatement("SELECT * FROM fbusers WHERE userid = ?");
				stmt.setString(1, userid);
				
				// 수행
				rs = stmt.executeQuery();
				
				if(rs.next()) {
					userinfo = new FacebookUser(rs.getInt("fid"),
							rs.getString("fb_id"),
							rs.getString("userid"),
							rs.getString("pwd"),
							rs.getString("photo_url"));
				}
				
		} finally {
			// 무슨 일이 있어도 리소스를 제대로 종료
			if (rs != null) try{rs.close();} catch(SQLException e) {}
			if (stmt != null) try{stmt.close();} catch(SQLException e) {}
			if (conn != null) try{conn.close();} catch(SQLException e) {}
		}
		
		return userinfo;
	}
	public static FacebookUser findByUserIdFromId(String fbid) throws NamingException, SQLException{
		FacebookUser userinfo=null;
		
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
	
		
		DataSource ds = getDataSource();
		
		
		try {
			conn = ds.getConnection();
			// 질의 준비
		
				stmt = conn.prepareStatement("SELECT userid FROM fbusers WHERE fb_id = ?");
				stmt.setString(1, fbid);
				
				// 수행
				rs = stmt.executeQuery();
				
				if(rs.next()) {
					userinfo = new FacebookUser(
							rs.getString("userid"));
				}
				
		} finally {
			// 무슨 일이 있어도 리소스를 제대로 종료
			if (rs != null) try{rs.close();} catch(SQLException e) {}
			if (stmt != null) try{stmt.close();} catch(SQLException e) {}
			if (conn != null) try{conn.close();} catch(SQLException e) {}
		}
		
		return userinfo;
	}
	
	public static boolean create(FacebookUser fbuser) throws SQLException, NamingException {
		int result;
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		DataSource ds = getDataSource();
		
		try {
			conn = ds.getConnection();

			// 질의 준비
			stmt = conn.prepareStatement(
					"INSERT INTO fbusers(fid, fb_id, userid, pwd, photo_url) " +
					"VALUES(?, ?, ?, ?, ?)"
					);
			stmt.setInt(1,  fbuser.getId());
			stmt.setString(2,  fbuser.getfbId());
			stmt.setString(3, fbuser.getUserid());
			stmt.setString(4, fbuser.getPwd());
			stmt.setString(5,  fbuser.getPhotoUrl());
			
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
	
	public static boolean update(FacebookUser fbuser) throws SQLException, NamingException {
		int result;
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		DataSource ds = getDataSource();
		
		try {
			conn = ds.getConnection();

			// 질의 준비
			stmt = conn.prepareStatement(
					"UPDATE fbusers " +
					"SET pwd=?"+
					"WHERE fid=?"
					);
			stmt.setString(1,  fbuser.getPwd());
			stmt.setInt(2,   fbuser.getId());
			
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
			stmt = conn.prepareStatement("DELETE FROM fbusers WHERE fid=?");
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
}
