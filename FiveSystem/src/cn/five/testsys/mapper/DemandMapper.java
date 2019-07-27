package cn.five.testsys.mapper;

import cn.five.testsys.entity.Demand;

public interface DemandMapper {
	Demand getDemand_req_id(int req_id);
	Demand getDemand_dem_id(int dem_id);
	int save(Demand demand);

}
