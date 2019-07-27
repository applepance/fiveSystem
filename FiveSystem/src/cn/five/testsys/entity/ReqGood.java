package cn.five.testsys.entity;

//create table reqGoods(
//        eg_id int(10) primary key  auto_increment  ,
//        req_id int(10) not null ,
//    foreign key ( req_id ) references reqInfos( req_id ) ,
//    gid int(10) not null ,
//    foreign key ( gid ) references goods( gid ) ,
//        req_num int(10) not null
//);

public class ReqGood {
	private int eg_id;
	private int req_id;
	private int gid;
	private int req_num;
	public int getEg_id() {
		return eg_id;
	}
	public void setEg_id(int eg_id) {
		this.eg_id = eg_id;
	}
	public int getReq_id() {
		return req_id;
	}
	public void setReq_id(int req_id) {
		this.req_id = req_id;
	}
	public int getGid() {
		return gid;
	}
	public void setGid(int gid) {
		this.gid = gid;
	}
	public int getReq_num() {
		return req_num;
	}
	public void setReq_num(int req_num) {
		this.req_num = req_num;
	}

}
