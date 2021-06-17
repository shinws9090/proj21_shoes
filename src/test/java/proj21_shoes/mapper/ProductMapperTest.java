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

import proj21_shoes.commend.ProductSelectCommend;
import proj21_shoes.config.ContextRoot;
import proj21_shoes.dto.Brand;
import proj21_shoes.dto.Category;
import proj21_shoes.dto.Employee;
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
	public void test01ProductByAll() {
		ProductSelectCommend a = new ProductSelectCommend();
		a.setBrandCode(1);
		List<Product> list = mapper.productBycommand(a);
		Assert.assertNotNull(list);
		log.debug(list.toString());
	}
	

	@Test
	public void test97InsertProduct() {
		log.debug(Thread.currentThread().getStackTrace()[1].getMethodName() + "()");

		Product product = new Product();
		product.setProductName("운동화");
		product.setBrand(new Brand(5));
		product.setGender("남");
		product.setCategory(new Category(888));
		product.setMaterial("가죽");
		product.setSeason("겨울");
		product.setCostPrice(50000);
		product.setSellPrice(80000);
		product.setEmployee(new Employee(101));

		log.debug(product.toString());
		int res = mapper.insertProduct(product);
		Assert.assertNotNull(res);
	}

	@Test
	public void test98UpdateProduct() {
		log.debug(Thread.currentThread().getStackTrace()[1].getMethodName() + "()");

		Product product = new Product();
		product.setProductCode(5);
		product.setProductName("구두");
		product.setBrand(new Brand(1));
		product.setGender("여");
		product.setCategory(new Category(1));
		product.setMaterial("가죽");
		product.setSeason("가을");
		product.setMadeDate(LocalDate.now());
		product.setCostPrice(60000);
		product.setSellPrice(90000);
		product.setRegistDate(LocalDate.now());
		product.setEmployee(new Employee(1));

		log.debug(product.toString());
		int res = mapper.updateProduct(product);
		Assert.assertNotNull(res);
	}

	@Test
	public void test99DeleteProduct() {
		log.debug(Thread.currentThread().getStackTrace()[1].getMethodName() + "()");

		Product product = new Product();
		product.setProductCode(5);

		log.debug(product.toString());
		int res = mapper.deleteProduct(5);
		Assert.assertNotNull(res);

	}

}
