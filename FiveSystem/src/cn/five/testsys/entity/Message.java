package cn.five.testsys.entity;

//create table messages(
//        mes_id int(10) primary key  auto_increment  ,
//        uid int(10) not null ,
//    foreign key ( uid ) references users( uid ) ,
//    req_id int(10) not null default 0,
//        dem_id int(10) not null default 0
//);

public class Message {
	private int mes_id;
	private int uid;
	private int req_id;
	private int dem_id;
	public int getMes_id() {
		return mes_id;
	}
	public void setMes_id(int mes_id) {
		this.mes_id = mes_id;
	}
	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}
	public int getReq_id() {
		return req_id;
	}
	public void setReq_id(int req_id) {
		this.req_id = req_id;
	}
	public int getDem_id() {
		return dem_id;
	}
	public void setDem_id(int dem_id) {
		this.dem_id = dem_id;
	}

}
