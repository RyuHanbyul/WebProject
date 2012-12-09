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

	public User(int id, String email, String userid, String pwd, String photoUrl) {
		super();
		this.id = id;
		this.email = email;
		this.userid = userid;
		this.pwd = pwd;
		this.photoUrl = photoUrl;
	}
	
	public User(String userid) {
		this.userid = userid;
	}

	// getter & setter 가 있어야 한다. (Eclipse 에서 자동 생성 가능)
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
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

	public void setUserid(String userid) {
		this.userid = userid;
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
