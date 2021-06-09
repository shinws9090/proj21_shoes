package proj21_shoes.mapper;

import static org.junit.Assert.fail;

import java.time.LocalDate;
import java.time.LocalDateTime;
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
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import proj21_shoes.config.ContextRoot;
import proj21_shoes.dto.Grade;
import proj21_shoes.dto.Member;
import proj21_shoes.dto.MemberDetail;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = { ContextRoot.class })
@FixMethodOrder(MethodSorters.NAME_ASCENDING)
@WebAppConfiguration
public class MemberMapperTest {
	protected static final Log log = LogFactory.getLog(MemberMapperTest.class);

	@Autowired
	private MemberMapper mapper;

	@After
	public void tearDown() throws Exception {
		System.out.println();
	}

	@Test
	public void test01SelectMemberAll() {
		log.debug(Thread.currentThread().getStackTrace()[1].getMethodName() + "()");
		List<Member> list = mapper.selectMemberAll();
		Assert.assertNotNull(list);
		list.stream().forEach(System.out::println);
	}

	@Test
	public void testSelectMemberByMCode() {
		log.debug(Thread.currentThread().getStackTrace()[1].getMethodName() + "()");
		Member member = mapper.selectMemberByMCode(8);
		System.out.println(member);
		Assert.assertNotNull(member);
	}

	@Test
	public void test3InsertMember() {
		log.debug(Thread.currentThread().getStackTrace()[1].getMethodName() + "()");
		System.out.println("====== insert start========");
		
	
		mapper.insertMember(new Member(new MemberDetail("133"), 1000, 0, new Grade(5), false, LocalDateTime.now()));
		System.out.println("=======end");

//	@Test
//	public void testUpdateMember() {
//		fail("Not yet implemented");
//	}
//
//	@Test
//	public void testDeleteMember() {
//		fail("Not yet implemented");
//	}

	}
}
