package kr.ac.mju.dislab.user;

import java.util.*;

import org.apache.commons.lang3.StringUtils;

public class FacebookUser implements java.io.Serializable {
	private static final long serialVersionUID = 2193897931951340673L;

	private int id;
	private String fbid;
	private String userid;
	private String pwd;
	private String photoUrl;
		
	// No-arg constructor 가 있어야 한다.
	public FacebookUser() {
	}

	public FacebookUser(int fid, String fb_id, String userid, String pwd, String photo_url) {
		super();
		this.id = fid;
		this.fbid = fb_id;
		this.userid = userid;
		this.pwd = pwd;
		this.photoUrl = photo_url;
	}
	
	public FacebookUser(String userid) {
		this.userid = userid;
	}

	// getter & setter 가 있어야 한다. (Eclipse 에서 자동 생성 가능)
	public int getId() {
		return id;
	}

	public void setId(int fid) {
		this.id = fid;
	}
	
	public String getfbId() {
		return fbid;
	}

	public void setfbId(String fb_id) {
		this.fbid = fb_id;
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

	public void setPhotoUrl(String photo_url) {
		this.photoUrl = photo_url;
	}
}
