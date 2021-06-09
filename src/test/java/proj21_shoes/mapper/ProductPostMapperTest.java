package proj21_shoes.mapper;

import java.util.ArrayList;
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
import proj21_shoes.dto.Image;
import proj21_shoes.dto.ProductPost;

@FixMethodOrder(MethodSorters.NAME_ASCENDING)
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = { ContextRoot.class })
@WebAppConfiguration
public class ProductPostMapperTest {

	private static final Log log = LogFactory.getLog(ProductPostMapperTest.class);

	@Autowired
	ProductPostMapper mapper;

	@After
	public void tearDown() throws Exception {
		System.out.println();
	}

	@Test
	public void test01ProductPostByAll() {
		log.debug(Thread.currentThread().getStackTrace()[1].getMethodName() + "()");

		List<ProductPost> list = mapper.productPostByAll();
		Assert.assertNotNull(list);
		log.debug(list.toString());
	}

	@Test
	public void test02InsertProductPost() {
		log.debug(Thread.currentThread().getStackTrace()[1].getMethodName() + "()");
		
		ProductPost productPost = new ProductPost();
		productPost.setProductCode(2);
		productPost.setProductMainImage(new byte[12]);
		productPost.setContent("내용");

		List<Image> list = new ArrayList<Image>();
		productPost.setImages(list);
		
		log.debug(productPost.toString());
		
		int res = mapper.insertProductPost(productPost);
		Assert.assertNotNull(res);
	}

	@Test
	public void test03UpdateProductPost() {
		log.debug(Thread.currentThread().getStackTrace()[1].getMethodName() + "()");

		ProductPost productPost = new ProductPost();
		productPost.setProductCode(2);
		productPost.setProductMainImage(new byte[12]);
		productPost.setContent("내용변경");

		List<Image> list = new ArrayList<Image>();
		productPost.setImages(list);
		
		log.debug(productPost.toString());
		
		int res = mapper.updateProductPost(productPost);
		Assert.assertNotNull(res);
	}

	@Test
	public void test04DeleteProductPost() {
		log.debug(Thread.currentThread().getStackTrace()[1].getMethodName() + "()");

		ProductPost productPost = new ProductPost();
		productPost.setProductCode(2);
		
		log.debug(productPost.toString());
		int res = mapper.deleteProductPost(productPost);
		Assert.assertNotNull(res);
	}

}
