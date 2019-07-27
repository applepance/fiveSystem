package cn.five.testsys.entity;

//create table reqInfos(
//        req_id int(10) primary key  auto_increment  ,
//        tit varchar(20) not null ,
//    note varchar(2000) ,
//        req_uid int(10) not null,
//    foreign key ( req_uid ) references users( uid ) ,
//        dep_id int(10) default 0 ,
//    manage_id int(10) default 0 ,
//    time timestamp NULL default CURRENT_TIMESTAMP
//);

public class ReqInfo {
	private int req_id;
	private String tit;
	private String note;
	private int req_uid;
	private int dep_id;
	private int manage_id;
	private String time;
	public int getReq_id() {
		return req_id;
	}
	public void setReq_id(int req_id) {
		this.req_id = req_id;
	}
	public String getTit() {
		return tit;
	}
	public void setTit(String tit) {
		this.tit = tit;
	}
	public String getNote() {
		return note;
	}
	public void setNote(String note) {
		this.note = note;
	}
	public int getReq_uid() {
		return req_uid;
	}
	public void setReq_uid(int req_uid) {
		this.req_uid = req_uid;
	}
	public int getDep_id() {
		return dep_id;
	}
	public void setDep_id(int dep_id) {
		this.dep_id = dep_id;
	}
	public int getManage_id() {
		return manage_id;
	}
	public void setManage_id(int manage_id) {
		this.manage_id = manage_id;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}

}
