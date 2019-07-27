package cn.five.testsys.entity;

//create table recovery(
//        rec_id int(10) primary key  auto_increment  ,
//        dem_id int(10) not null ,
//    foreign key ( dem_id ) references demands( dem_id ) ,
//    evaluation varchar(2000) ,
//    rec_date timestamp NULL default CURRENT_TIMESTAMP,
//    star int(5) not null
//);

public class Recovery {
	private int rec_id ;
	private int dem_id ;
	private String evaluation ;
	private String rec_date ;
	private int star ;
	public int getRec_id() {
		return rec_id;
	}
	public void setRec_id(int rec_id) {
		this.rec_id = rec_id;
	}
	public int getDem_id() {
		return dem_id;
	}
	public void setDem_id(int dem_id) {
		this.dem_id = dem_id;
	}
	public String getEvaluation() {
		return evaluation;
	}
	public void setEvaluation(String evaluation) {
		this.evaluation = evaluation;
	}
	public String getRec_date() {
		return rec_date;
	}
	public void setRec_date(String rec_date) {
		this.rec_date = rec_date;
	}
	public int getStar() {
		return star;
	}
	public void setStar(int star) {
		this.star = star;
	}

}
