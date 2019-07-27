package cn.five.testsys.entity;

//
//用户表users
//用户号uid		|| 用户名uname		|| 密码pwd	|| 权限power	||
//create table users(
//        uid int(10) primary key  auto_increment  ,
//        uname varchar(20) not null unique ,
//        pwd varchar(20) not null,
//        power varchar(30) not null
//);

public class User {
	private int uid;
	private String uname;
	private String pwd;
	private String power;
	
	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}
	public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getPower() {
		return power;
	}
	public void setPower(String power) {
		this.power = power;
	}
	public User() {}
	public User(String uname,String pwd,String power) {
		this.uname=uname;
		this.pwd=pwd;
		this.power=power;
	}
}
