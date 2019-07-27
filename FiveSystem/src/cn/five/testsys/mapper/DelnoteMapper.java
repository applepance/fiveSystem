package cn.five.testsys.mapper;

import cn.five.testsys.entity.Delnote;

public interface DelnoteMapper {
	Delnote getDelnote_dem_id(int dem_id);
	int update_evaluation(Delnote delnote);
	int save(Delnote delnote);

}
