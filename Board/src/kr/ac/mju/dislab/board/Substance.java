package kr.ac.mju.dislab.board;

import java.util.*;
import org.apache.commons.lang3.StringUtils;

public class Substance implements java.io.Serializable {
	private static final long serialVersionUID = 2193897931951340673L;
	
	private static final String[] categoryNames = {"서울", "경기도", "강원도", "충청도", "전라도", "경상도", "제주"}; 
	
	private int id;
	private String user_id;
	private String category;
	private String subject;
	private String content;
	private String spot;
	private String image;
	private String created_at;

	public Substance() {
	}

	public Substance(int sid, String user_id, String category, String subject, String content, String spot,String image, String created_at) {
		this.id = sid;
		this.user_id = user_id;
		this.category = category;
		this.subject = subject;
		this.content = content;
		this.spot = spot;
		this.image = image;
		this.created_at = created_at;
	}
	public void setId(int sid){
		this.id = sid;
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
	public void setCategory(String category){
		this.category = category;
	}
	public String getCategory(){
		return category;
	}
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
	
	public String[] getCategoryNames() {
		return categoryNames;
	}
	public String checkCategory(String categoryName) {
		return (categoryName.equals(category)) ? "selected" : "";
	}
	public void setSpot(String spot){
		this.spot = spot;
	}
	public String getSpot(){
		return spot;
	}
	public void setImage(String image){
		this.image = image;
	}
	public String getImage(){
		return image;
	}
	public void addImage(String image){
		this.content+=image;
	}
}
