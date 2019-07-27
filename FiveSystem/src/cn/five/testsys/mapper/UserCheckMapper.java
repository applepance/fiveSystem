package cn.five.testsys.mapper;

import cn.five.testsys.entity.UserCheck;

public interface UserCheckMapper {
	UserCheck getUserCheck_ass(int ass_id);
	UserCheck getUserCheck_leader(int leader_id);
}
