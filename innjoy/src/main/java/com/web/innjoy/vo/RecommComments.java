package com.web.innjoy.vo;

import java.util.List;

public class RecommComments {

	private Recomm recomm;
	private List<Recomm_comm> comms;
	
	public RecommComments() {}
	
	public RecommComments(Recomm recomm, List<Recomm_comm> comms) {
		this.recomm = recomm;
		this.comms = comms;
	}
	public Recomm getRecomm() {
		return recomm;
	}
	public void setRecomm(Recomm recomm) {
		this.recomm = recomm;
	}
	public List<Recomm_comm> getComms() {
		return comms;
	}
	public void setComms(List<Recomm_comm> comms) {
		this.comms = comms;
	}
	
	
}
