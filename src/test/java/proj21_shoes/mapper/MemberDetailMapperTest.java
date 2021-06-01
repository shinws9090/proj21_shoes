package proj21_shoes.mapper;

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


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = { ContextRoot.class })
@FixMethodOrder(MethodSorters.NAME_ASCENDING)
@WebAppConfiguration
public class MemberDetailMapperTest {
	protected static final Log log = LogFactory.getLog(MemberDetailMapperTest.class);
	@Autowired
	private MemberDetailMapper mapper;

	@After
	public void tearDown() throws Exception {
		System.out.println();
	}
//
//	@Test
//	public void testSelectMemberDetailAll() {
//		fail("Not yet implemented");
//	}
//
//	@Test
//	public void testSelectMemberDetailById() {
//		fail("Not yet implemented");
//	}

	@Test
	public void test01InsertMemberDetail() {
		log.debug(Thread.currentThread().getStackTrace()[1].getMethodName() + "()");
		MemberDetail newMember = new MemberDetail("testId", "111111", "김예진",true);
		System.out.println(newMember);
		int res = mapper.insertMemberDetail(newMember);
		Assert.assertEquals(1, res);
	}
//
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
