package proj21_shoes.service.impl;

import org.apache.ibatis.logging.Log;
import org.apache.ibatis.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import proj21_shoes.commend.MyPageSelectCommend;
import proj21_shoes.mapper.MyPageSelectMapper;
import proj21_shoes.service.MyPageService;
@Service
public class MyPageServiceImpl implements MyPageService {
static final Log log = LogFactory.getLog(MyPageServiceImpl.class);
	
	@Autowired
	private MyPageSelectMapper mapper;

	@Override
	public MyPageSelectCommend showMyPageById(String memberid) {
		return mapper.selectMyPageById(memberid);
	}

}
