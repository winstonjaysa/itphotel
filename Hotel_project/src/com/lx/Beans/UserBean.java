package com.lx.Beans;

import com.mysql.jdbc.Blob;

public class UserBean {
	private String fname,lname,uname,password,role,admin_role_type;
	private boolean valid;
	
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	private int uid;
	public String getFname() {
		return fname;
	}
	public void setFname(String fname) {
		this.fname = fname;
	}
	public String getLname() {
		return lname;
	}
	public void setLname(String lname) {
		this.lname = lname;
	}
	public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}
	public boolean isValid() {
		return valid;
	}
	public void setValid(boolean valid) {
		this.valid = valid;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	public String getAdmin_role_type() {
		return admin_role_type;
	}
	public void setAdmin_role_type(String admin_role_type) {
		this.admin_role_type = admin_role_type;
	}
	
	
	
}
