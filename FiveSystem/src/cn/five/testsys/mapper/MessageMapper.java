package cn.five.testsys.mapper;

import java.util.List;
import cn.five.testsys.entity.Message;

public interface MessageMapper {
	List<Message> getMessage_uid(int uid);
	int save(Message message);

}
