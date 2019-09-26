package com.lx.Beans;

public class Employee {
	
	private int id;
	private String Nic;
	private String Name;
	private String Address;
	private String Gender;
	private int Age;
	private String Position;
	private Double Hourlyrate;
	private Double Fixed;

	public Employee(int id, String nic, String name, String address, String gender, int age, String position,
			Double hourlyrate, Double fixed) {
	
		this.id = id;
		this.Nic = nic;
		this.Name = name;
		this.Address = address;
		this.Gender = gender;
		this.Age = age;
		this.Position = position;
		this.Hourlyrate = hourlyrate;
		this.Fixed = fixed;
	}
	
	public Employee(int id, String nic, String name, String address,int age, String position,
			Double hourlyrate, Double fixed) {
	
		this.id = id;
		this.Nic = nic;
		this.Name = name;
		this.Address = address;
		this.Age = age;
		this.Position = position;
		this.Hourlyrate = hourlyrate;
		this.Fixed = fixed;
	}
	
	
	public Employee(String nic, String name, String address, String gender,  int age, String position,
			Double hourlyrate,  Double fixed) {
	
		this.Nic = nic;
		this.Name = name;
		this.Address = address;
		this.Gender = gender;
		this.Age = age;
		this.Position = position;
		this.Hourlyrate = hourlyrate;
		this.Fixed = fixed;
	}
	
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getNic() {
		return Nic;
	}
	public void setNic(String nic) {
		Nic = nic;
	}
	public String getName() {
		return Name;
	}
	public void setName(String name) {
		Name = name;
	}
	public String getAddress() {
		return Address;
	}
	public void setAddress(String address) {
		Address = address;
	}
	public String getGender() {
		return Gender;
	}
	public void setGender(String gender) {
		Gender = gender;
	}
	public  int getAge() {
		return Age;
	}
	public void setAge( int age) {
		Age = age;
	}
	public String getPosition() {
		return Position;
	}
	public void setPosition(String position) {
		Position = position;
	}
	public  Double getHourlyrate() {
		return Hourlyrate;
	}
	public void setHourlyrate( Double hourlyrate) {
		Hourlyrate = hourlyrate;
	}
	public  Double getFixed() {
		return Fixed;
	}
	public void setFixed( Double fixed) {
		Fixed = fixed;
	}
	
	public String toString() {
		return "Employee [id=" + id + ", Nic=" + Nic + ", Name=" + Name + ", Address=" + Address + ", Gender=" + Gender
				+ ", Age=" + Age + ", Position=" + Position + ", Hourlyrate=" + Hourlyrate + ", Fixed=" + Fixed + "]";
	}
	
	
	

}
