package kr.ac.mju.dislab.board;

import java.io.Serializable;

import kr.ac.mju.dislab.user.User;

public class BoardAndUser implements Serializable {
	private static final long serialVersionUID = -7504970190083622353L;
	

	private Substance substance;
	private User user;
	
	
	public BoardAndUser(Substance substance, User user){
		this.substance = substance;
		this.user = user;
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

}
