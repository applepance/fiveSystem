package cn.five.testsys.mapper;

import cn.five.testsys.entity.ReqInfo;

public interface ReqInfoMapper {
	ReqInfo getReqInfo_req_id(int req_id);
	ReqInfo getReqInfo_tit(String tit);
	int save(ReqInfo reqInfo);
	int updateDep_id(ReqInfo reqInfo);
	int updateManage_id(ReqInfo reqInfo);
}
