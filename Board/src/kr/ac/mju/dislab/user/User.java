package kr.ac.mju.dislab.user;

import java.util.*;

import org.apache.commons.lang3.StringUtils;

public class User implements java.io.Serializable {
	private static final long serialVersionUID = 2193897931951340673L;

	private int id;
	private String email;
	private String userid;
	private String pwd;
	private String photoUrl;
		
	// No-arg constructor 가 있어야 한다.
	public User() {
	}

	public User(int uid, String email, String u_userid, String pwd, String photoUrl) {
		super();
		this.id = uid;
		this.email = email;
		this.userid = u_userid;
		this.pwd = pwd;
		this.photoUrl = photoUrl;
	}
	
	public User(String u_userid) {
		this.userid = u_userid;
	}

	// getter & setter 가 있어야 한다. (Eclipse 에서 자동 생성 가능)
	public int getId() {
		return id;
	}

	public void setId(int uid) {
		this.id = uid;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
	
	public String getUserid() {
		return userid;
	}

	public void setUserid(String u_userid) {
		this.userid = u_userid;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getPhotoUrl() {
		return photoUrl;
	}

	public void setPhotoUrl(String photoUrl) {
		this.photoUrl = photoUrl;
	}
}
