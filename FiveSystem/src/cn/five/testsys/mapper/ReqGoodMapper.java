package cn.five.testsys.mapper;

import cn.five.testsys.entity.ReqGood;
import java.util.List;

public interface ReqGoodMapper {
	List<ReqGood> getReqGood_req_id(int req_id);
	int save(ReqGood reqGood);

}
