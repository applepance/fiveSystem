package cn.five.testsys.mapper;

import cn.five.testsys.entity.Recovery;

public interface RecoveryMapper {
	Recovery getRecovery_dem_id(int dem_id);
	int save(Recovery recovery);

}
