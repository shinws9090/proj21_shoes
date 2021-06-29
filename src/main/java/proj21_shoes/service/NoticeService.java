package proj21_shoes.service;

import java.util.List;

import org.springframework.stereotype.Service;

import proj21_shoes.dto.Notice;

@Service
public interface NoticeService {
	public List<Notice> selectNoticebyAllList();
}
