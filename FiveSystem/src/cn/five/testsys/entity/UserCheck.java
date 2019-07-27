package cn.five.testsys.entity;

//create table userChecks(
//        uc_id int(10) primary key  auto_increment  ,
//        ass_id int(10) not null  ,
//    leader_id int(10) not null
//);

public class UserCheck {
	private int uc_id;
	private int ass_id;
	private int leader_id;
	public int getUc_id() {
		return uc_id;
	}
	public void setUc_id(int uc_id) {
		this.uc_id = uc_id;
	}
	public int getAss_id() {
		return ass_id;
	}
	public void setAss_id(int ass_id) {
		this.ass_id = ass_id;
	}
	public int getLeader_id() {
		return leader_id;
	}
	public void setLeader_id(int leader_id) {
		this.leader_id = leader_id;
	}
}
