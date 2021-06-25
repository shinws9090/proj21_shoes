package proj21_shoes.mapper;

import static org.junit.Assert.fail;

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

import proj21_shoes.commend.MyQnaViewCommand;
import proj21_shoes.config.ContextRoot;
import proj21_shoes.dto.ProductPost;
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = { ContextRoot.class })
@FixMethodOrder(MethodSorters.NAME_ASCENDING)
@WebAppConfiguration
public class MyQnaMapperTest {
	protected static final Log log = LogFactory.getLog(MyQnaMapperTest.class);


	@Autowired
	private MyQnaMapper mapper;
	
	@After
	public void tearDown() throws Exception {
		System.out.println();
	}
	
//	@Test
	//public void test01SelectbyId() {
	//	log.debug(Thread.currentThread().getStackTrace()[1].getMethodName() + "()");
	//	List<MyQnaViewCommand> myQnaList = mapper.selectProductQnAbyId("1234");
	//	System.out.println("myQna>>>"+ myQnaList);
//		
//		Assert.assertNotNull(myQnaList);
//		log.debug(myQnaList.toString());
//		
//	}

	//@Test
	public void testUpdateMember() {
		fail("Not yet implemented");
	}

	//@Test
	public void testDeleteMember() {
		fail("Not yet implemented");
	}

}
