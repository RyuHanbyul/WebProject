package kr.ac.mju.dislab.board;

import java.sql.*;

import javax.naming.*;
import javax.sql.*;


public class RepinDAO {
	public static DataSource getDataSource() throws NamingException {
		Context initCtx = null;
		Context envCtx = null;

		// Obtain our environment naming context
		initCtx = new InitialContext();
		envCtx = (Context) initCtx.lookup("java:comp/env");

		// Look up our data source
		return (DataSource) envCtx.lookup("jdbc/WebDB");
	}
	public static boolean userrepin(int user_id, int post_id) throws SQLException, NamingException {
		
		System.out.println(user_id);
		System.out.println(post_id);
		
		int result;
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;

		DataSource ds = getDataSource();

		try {
			conn = ds.getConnection();

			// 질의 준비
			stmt = conn.prepareStatement(
					"INSERT INTO pin(user_id, post_id) " +
							"VALUES(?, ?)"
					);
			stmt.setInt(1,  user_id);
			stmt.setInt(2,  post_id);

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
	
	public static boolean fbuserrepin(String user_id, int post_id) throws SQLException, NamingException {
		
		System.out.println(user_id);
		System.out.println(post_id);
		
		int result;
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;

		DataSource ds = getDataSource();

		try {
			conn = ds.getConnection();

			// 질의 준비
			stmt = conn.prepareStatement(
					"INSERT INTO pin(user_id, post_id) " +
							"VALUES(?, ?)"
					);
			stmt.setString(1,  user_id);
			stmt.setInt(2,  post_id);

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
	public static Repin findByUserId(int user_id) throws NamingException, SQLException{
		Repin repin = null;

		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;

		DataSource ds = getDataSource();

		try {
			conn = ds.getConnection();

			// 질의 준비
			stmt = conn.prepareStatement("SELECT * FROM pin WHERE user_id = ?");
			stmt.setInt(1, user_id);

			// 수행
			rs = stmt.executeQuery();

			if (rs.next()) {
				repin = new Repin(
						rs.getString("user_id"),
						rs.getString("post_id"));
			}		
		} finally {
			// 무슨 일이 있어도 리소스를 제대로 종료
			if (rs != null) try{rs.close();} catch(SQLException e) {}
			if (stmt != null) try{stmt.close();} catch(SQLException e) {}
			if (conn != null) try{conn.close();} catch(SQLException e) {}
		}

		return repin;
	}
	
	public static Repin findByUserFbId(String user_id) throws NamingException, SQLException{
		Repin repin = null;

		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;

		DataSource ds = getDataSource();

		try {
			conn = ds.getConnection();

			// 질의 준비
			stmt = conn.prepareStatement("SELECT * FROM pin WHERE user_id = ?");
			stmt.setString(1, user_id);

			// 수행
			rs = stmt.executeQuery();

			if (rs.next()) {
				repin = new Repin(
						rs.getString("user_id"),
						rs.getString("post_id"));
			}		
		} finally {
			// 무슨 일이 있어도 리소스를 제대로 종료
			if (rs != null) try{rs.close();} catch(SQLException e) {}
			if (stmt != null) try{stmt.close();} catch(SQLException e) {}
			if (conn != null) try{conn.close();} catch(SQLException e) {}
		}

		return repin;
	}
	public static boolean removeuserpin(int user_id, int post_id) throws NamingException, SQLException {
		int result;
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;

		DataSource ds = getDataSource();

		try {
			conn = ds.getConnection();

			// 질의 준비
			stmt = conn.prepareStatement("DELETE FROM pin WHERE user_id=?, post_id =?");
			stmt.setInt(1,  user_id);
			stmt.setInt(2, post_id);

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
	public static boolean removefbuserpin(String user_id, int post_id) throws NamingException, SQLException {
		int result;
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;

		DataSource ds = getDataSource();

		try {
			conn = ds.getConnection();

			// 질의 준비
			stmt = conn.prepareStatement("DELETE FROM pin WHERE user_id=?, post_id =?");
			stmt.setString(1,  user_id);
			stmt.setInt(2, post_id);

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
