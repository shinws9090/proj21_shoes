package proj21_shoes.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import proj21_shoes.dto.Notice;
import proj21_shoes.mapper.NoticeMapper;
import proj21_shoes.service.NoticeService;

@Service
public class NoticeServiceImpl implements NoticeService {
	@Autowired
	NoticeMapper mapper;
	
	@Override
	public List<Notice> selectNoticebyAllList() {
		return mapper.selectNoticebyAllList();
	}

}
