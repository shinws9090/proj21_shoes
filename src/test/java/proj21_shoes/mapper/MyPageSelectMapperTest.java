package proj21_shoes.mapper;

import static org.junit.Assert.*;

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

import proj21_shoes.commend.MyPageSelectCommend;
import proj21_shoes.config.ContextRoot;
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = { ContextRoot.class })
@FixMethodOrder(MethodSorters.NAME_ASCENDING)
@WebAppConfiguration
public class MyPageSelectMapperTest {
	protected static final Log log = LogFactory.getLog(MyPageSelectMapperTest.class);

	@Autowired
	private MyPageSelectMapper mapper;
	
	@After
	public void tearDown() throws Exception {
		System.out.println();
	}
	
	@Test
	public void test01SelectMyPageById() {
		log.debug(Thread.currentThread().getStackTrace()[1].getMethodName() + "()");
		MyPageSelectCommend myPage =mapper.selectMyPageById("11");
		System.out.println(myPage);
	//	Assert.assertNotNull(myPage);
		System.out.println(myPage);


	}

}
