package proj21_shoes.mapper;

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

import proj21_shoes.commend.ProductSelectCommend;
import proj21_shoes.config.ContextRoot;
import proj21_shoes.dto.Product;
 

@FixMethodOrder(MethodSorters.NAME_ASCENDING)
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = { ContextRoot.class })
@WebAppConfiguration
public class ProductMapperTest {
	
	private static final Log log = LogFactory.getLog(ProductMapperTest.class);
	
	
	@Autowired
	ProductMapper mapper;

	@After
	public void tearDown() throws Exception {
		System.out.println();
	}
	
	
	@Test
	public void testProductByAll() {
		ProductSelectCommend a = new ProductSelectCommend();
		a.setBrandCode(1);
		List<Product> list = mapper.productBycommand(a);
		Assert.assertNotNull(list);
		log.debug(list.toString());
	}

}
