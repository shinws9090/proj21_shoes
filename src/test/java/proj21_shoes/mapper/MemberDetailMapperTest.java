package proj21_shoes.mapper;

import java.time.LocalDate;
import java.util.List;

import org.apache.ibatis.logging.Log;
import org.apache.ibatis.logging.LogFactory;
import org.junit.After;
import org.junit.Assert;
import org.junit.FixMethodOrder;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.MethodSorters;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import proj21_shoes.config.ContextRoot;
import proj21_shoes.dto.MemberDetail;
import proj21_shoes.dto.RegisterRequest;
import proj21_shoes.service.RegisterMemberDetailService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = { ContextRoot.class })
@FixMethodOrder(MethodSorters.NAME_ASCENDING)
@WebAppConfiguration
public class MemberDetailMapperTest {
	protected static final Log log = LogFactory.getLog(MemberDetailMapperTest.class);
	@Autowired
	private MemberDetailMapper mapper;
	@Autowired
	private RegisterMemberDetailService service;

	@After
	public void tearDown() throws Exception {
		System.out.println();
	}


//	@Test
//	public void test03SelectMemberDetailAll() {
//		log.debug(Thread.currentThread().getStackTrace()[1].getMethodName() + "()");
//
//		List<MemberDetail> list = mapper.selectMemberDetailAll();
//		Assert.assertNotNull(list);
//		list.stream().forEach(System.out::println);
//	}

	@Test
	public void test01SelectMemberDetailById() {
		log.debug(Thread.currentThread().getStackTrace()[1].getMethodName() + "()");
		String s = "aaa";
		MemberDetail member = mapper.selectMemberDetailById(s);
		System.out.println(member);
		Assert.assertNotNull(member);
		//member.stream().forEach(System.out::println);

	}

	@Test
	public void test02InsertMemberDetail() {
		log.debug(Thread.currentThread().getStackTrace()[1].getMethodName() + "()");
		System.out.println("======start========");

		mapper.insertMemberDetail(new MemberDetail("testId22", "1111111", "김예진",true,LocalDate.now(), "test@gmail.com","010-1234-5678","12345","대구","상세주소"));
	
		//Assert.assertEquals(1, newMember);
		//mapper.selectMemberDetailById(newMember.getMemberId());
		
	}

//	@Test
//	public void testUpdateMemberDetail() {
//		fail("Not yet implemented");
//	}
//
//	@Test
//	public void testDeleteMemberDetail() {
//		fail("Not yet implemented");
//	}

}
