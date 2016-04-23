package com.SSHForum.Bean;

import java.util.HashSet;
import java.util.Set;

public class Plate {
	private int PID;
	private String PName;
	private int PTopicCount;
	private User Master;
	private Set<Plate> plates=new HashSet<Plate>();
	private Set<Theme> theme=new HashSet<Theme>();
	public Plate() {}

	public Plate(int pID, String pName, int pTopicCount, User master,
			Set<Plate> plates, Set<Theme> theme) {
		super();
		PID = pID;
		PName = pName;
		PTopicCount = pTopicCount;
		Master = master;
		this.plates = plates;
		this.theme = theme;
	}


	public int getPID() {
		return PID;
	}

	public void setPID(int PiD) {
		PID = PiD;
	}

	public String getPName() {
		return PName;
	}

	public void setPName(String pName) {
		PName = pName;
	}

	public int getPTopicCount() {
		return PTopicCount;
	}

	public void setPTopicCount(int pTopicCount) {
		PTopicCount = pTopicCount;
	}
	
	public User getMaster() {
		return Master;
	}

	public void setMaster(User master) {
		Master = master;
	}
	

	public Set<Plate> getPlates() {
		return plates;
	}
	public void setPlates(Set<Plate> plates) {
		this.plates = plates;
	}
	public Set<Theme> getTheme() {
		return theme;
	}

	public void setTheme(Set<Theme> theme) {
		this.theme = theme;
	}

	@Override
	public String toString() {
		return "Plate [PID=" + PID + ", PName=" + PName + ", PTopicCount="
				+ PTopicCount + ", Master=" + Master + ", plates=" + plates
				+ ", theme=" + theme + "]";
	}

	
}
