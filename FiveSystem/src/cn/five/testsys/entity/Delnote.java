package cn.five.testsys.entity;

//create table delnotes(
//        del_id int(10) primary key  auto_increment  ,
//        uid int(10) not null ,
//    req_uid int(10) not null ,
//    dem_id int(10) not null,
//    foreign key ( dem_id ) references demands( dem_id ) ,
//    del_date timestamp NULL default CURRENT_TIMESTAMP,
//    evaluation varchar(2000) ,
//    star int(5) not null
//);

public class Delnote {
	private int del_id;
	private int uid;
	private int req_uid;
	private int dem_id;
	private String del_date;
	private String evaluation;
	private int star;
	public Delnote() {
		this.evaluation="";
	}
	public int getDel_id() {
		return del_id;
	}
	public void setDel_id(int del_id) {
		this.del_id = del_id;
	}
	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}
	public int getReq_uid() {
		return req_uid;
	}
	public void setReq_uid(int req_uid) {
		this.req_uid = req_uid;
	}
	public int getDem_id() {
		return dem_id;
	}
	public void setDem_id(int dem_id) {
		this.dem_id = dem_id;
	}
	public String getDel_date() {
		return del_date;
	}
	public void setDel_date(String del_date) {
		this.del_date = del_date;
	}
	public String getEvaluation() {
		return evaluation;
	}
	public void setEvaluation(String evaluation) {
		this.evaluation = evaluation;
	}
	public int getStar() {
		return star;
	}
	public void setStar(int star) {
		this.star = star;
	}

}
