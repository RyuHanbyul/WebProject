package kr.ac.mju.dislab.board;

import java.util.*;
import org.apache.commons.lang3.StringUtils;

public class Substance implements java.io.Serializable {
	private static final long serialVersionUID = 2193897931951340673L;
	
	private int id;
	private String user_id;
	private String subject;
	private String content;
	private String created_at;
	
	public Substance() {
	}

	public Substance(int id, String user_id,String subject, String content,String created_at) {
		this.id = id;
		this.user_id = user_id;
		this.subject = subject;
		this.content = content;
		this.created_at = created_at;
	}
	public void setId(int id){
		this.id = id;
	}
	public int getId(){
		return id;
	}

	public void setUser_id(String user_id){
		this.user_id = user_id;
	}
	public String getUser_id(){
		return user_id;
	}
//	public void setCategory_name(String category_name){
//		this.category_name = category_name;
//	}
//	public String getCategory_name(){
//		return category_name;
//	}
	// getter & setter 가 있어야 한다. (Eclipse 에서 자동 생성 가능)
	public void setCreate_at(String created_at){
		this.created_at = created_at;
	}
	public String getCreated_at(){
		return created_at;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getSubject() {
		return subject;
	}

	public String getContent() {
		return content;
	}
}
