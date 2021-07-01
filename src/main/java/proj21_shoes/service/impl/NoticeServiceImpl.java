package proj21_shoes.service.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import proj21_shoes.commend.SearchCriteria;
import proj21_shoes.dto.Notice;
import proj21_shoes.mapper.NoticeMapper;
import proj21_shoes.service.NoticeService;

@Service
public class NoticeServiceImpl implements NoticeService {
	@Autowired
	NoticeMapper mapper;

	@Override
	public List<Notice> findAll(SearchCriteria scri) throws Exception {
		return mapper.findAll(scri);
	}

	@Override
	public int countInfoList(SearchCriteria scri) throws Exception {
		return mapper.countInfoList(scri);
	}

	@Override
	public List<Notice> selectNoticebyAllList() {
		return mapper.selectNoticebyAllList();
	}

	@Override
	public Notice detailView(int boardCode) throws Exception {
		return mapper.detailView(boardCode);
	}

	@Override
	public int insertNotice(Notice notice) {
		return mapper.insertNotice(notice);
	}

	@Override
	public int updateNotice(Notice notice) {
		return mapper.updateNotice(notice);
	}

	@Override
	public int deleteNotice(Notice notice) {
		return mapper.deleteNotice(notice);
	}

}
