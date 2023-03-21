package com.ReachRich.controller;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class indexController {
	
	private static final Logger log = LoggerFactory.getLogger(indexController.class);
	
	
	@RequestMapping(value="/index.do")
	public String indexGo(){
		return "/index";
	}
	
	@GetMapping("Ajax")
	public @ResponseBody String index() {
	    String url = "https://finance.naver.com/item/main.naver?code=005930";
	    //ResponseEntity<String> entity = null;
	    log.info("컨트롤러 시동");
	    String entity ="";
	    try {
	        Document doc = Jsoup.connect(url).get();
	        Elements e1234 = doc.getElementsByAttributeValue("class", "no_today");
	        entity = e1234.select("span").get(0).text();
	        //entity = new ResponseEntity<String>( e1234.select("span").get(0).text(),HttpStatus.OK);
	    } catch (Exception e) {
	        e.printStackTrace();
	        //entity = new ResponseEntity<String>(e.getMessage(),HttpStatus.BAD_REQUEST);
	    }
	    return entity;
	}
}
