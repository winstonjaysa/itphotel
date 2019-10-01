package com.lx.Beans;

public class ReservationBeans {
	private int rid,uid,reservation_type,budget_package_type,air_type,mini_bar,swimming_pool;
	private int children,adults;
	private String uname,check_in,check_out;
	
	
	public int getRid() {
		return rid;
	}
	public void setRid(int rid) {
		this.rid = rid;
	}
	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}
	public int getReservation_type() {
		return reservation_type;
	}
	public void setReservation_type(int reservation_type) {
		this.reservation_type = reservation_type;
	}
	public int getBudget_package_type() {
		return budget_package_type;
	}
	public void setBudget_package_type(int budget_package_type) {
		this.budget_package_type = budget_package_type;
	}
	public int getAir_type() {
		return air_type;
	}
	public void setAir_type(int air_type) {
		this.air_type = air_type;
	}
	
	public int getMini_bar() {
		return mini_bar;
	}
	public void setMini_bar(int mini_bar) {
		this.mini_bar = mini_bar;
	}
	public int getSwimming_pool() {
		return swimming_pool;
	}
	public void setSwimming_pool(int swimming_pool) {
		this.swimming_pool = swimming_pool;
	}
	
	public String getCheck_in() {
		return check_in;
	}
	public void setCheck_in(String check_in) {
		this.check_in = check_in;
	}
	public String getCheck_out() {
		return check_out;
	}
	public void setCheck_out(String check_out) {
		this.check_out = check_out;
	}
	public int getChildren() {
		return children;
	}
	public void setChildren(int children) {
		this.children = children;
	}
	public int getAdults() {
		return adults;
	}
	public void setAdults(int adults) {
		this.adults = adults;
	}
	public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
	
}
