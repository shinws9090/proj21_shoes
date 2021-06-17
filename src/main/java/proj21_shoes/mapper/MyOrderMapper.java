package proj21_shoes.mapper;

import java.util.List;

import org.springframework.stereotype.Component;

import proj21_shoes.commend.MyOrderCommend;

@Component
public interface MyOrderMapper {

	List<MyOrderCommend> selectMyOrderById(String memberid);					//회원id로 검색

}
