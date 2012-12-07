package kr.ac.mju.dislab.board;

import java.io.Serializable;

import kr.ac.mju.dislab.user.User;
import kr.ac.mju.dislab.user.FacebookUser;

public class BoardAndUser implements Serializable {
	private static final long serialVersionUID = -7504970190083622353L;
	

	private Substance substance;
	private User user;
	private FacebookUser fbuser;
	
	
	public BoardAndUser(Substance substance, User user, FacebookUser fbuser){
		this.substance = substance;
		this.user = user;
		this.fbuser = fbuser;
	}


	public Substance getSubstance() {
		return substance;
	}


	public void setSubstance(Substance substance) {
		this.substance = substance;
	}


	public User getUser() {
		return user;
	}


	public void setUser(User user) {
		this.user = user;
	}
	
	public FacebookUser getFbUser() {
		return fbuser;
	}


	public void setFbUser(FacebookUser fbuser) {
		this.fbuser = fbuser;
	}

}
