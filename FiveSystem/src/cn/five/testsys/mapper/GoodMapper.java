package cn.five.testsys.mapper;

import java.util.List;
import cn.five.testsys.entity.Good;

public interface GoodMapper {
	Good getGood_gname(String gname);
	Good getGood_gname_use(String gname);
	Good getGood_gid(int gid);
	List<Good> getGood_allgtype(String gtype);
	List<Good> getGood_allwait(String gstatus);
	int update_gnum(Good good);
	int save(Good good);

}
