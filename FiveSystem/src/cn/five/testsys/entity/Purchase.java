package cn.five.testsys.entity;

//create table purchases(
//        pur_id int(10) primary key  auto_increment  ,
//        dem_id int(10) not null default 0,
//    gname varchar(20) not null ,
//    gnum int(10) not null,
//    gtype varchar(20)not null,
//    pur_date timestamp NULL default CURRENT_TIMESTAMP
//);

public class Purchase {
	private int pur_id;
	private int dem_id;
	private String gname;
	private int gnum;
	private String gtype;
	private String pur_date;
	public int getPur_id() {
		return pur_id;
	}
	public void setPur_id(int pur_id) {
		this.pur_id = pur_id;
	}
	public int getDem_id() {
		return dem_id;
	}
	public void setDem_id(int dem_id) {
		this.dem_id = dem_id;
	}
	public String getGname() {
		return gname;
	}
	public void setGname(String gname) {
		this.gname = gname;
	}
	public int getGnum() {
		return gnum;
	}
	public void setGnum(int gnum) {
		this.gnum = gnum;
	}
	public String getGtype() {
		return gtype;
	}
	public void setGtype(String gtype) {
		this.gtype = gtype;
	}
	public String getPur_date() {
		return pur_date;
	}
	public void setPur_date(String pur_date) {
		this.pur_date = pur_date;
	}

}
