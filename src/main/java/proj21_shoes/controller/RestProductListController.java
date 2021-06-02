package proj21_shoes.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import proj21_shoes.service.ProductService;

@RestController
@RequestMapping("/api")
public class RestProductListController {
	
	@Autowired
	ProductService service;
	
	
}
