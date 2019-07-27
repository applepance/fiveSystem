package cn.five.testsys.entity;

//create table goods(
//        gid int(10) primary key  auto_increment  ,
//        gname varchar(20) not null ,
//        gnum int(10) not null,
//        gstatus varchar(30) default 'in-use',
//    gtype varchar(20)not null
//);

public class Good {
	private int gid;
	private String gname;
	private int gnum;
	private String gstatus;
	private String gtype;
	public int getGid() {
		return gid;
	}
	public void setGid(int gid) {
		this.gid = gid;
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
	public String getGstatus() {
		return gstatus;
	}
	public void setGstatus(String gstatus) {
		this.gstatus = gstatus;
	}
	public String getGtype() {
		return gtype;
	}
	public void setGtype(String gtype) {
		this.gtype = gtype;
	}

}
