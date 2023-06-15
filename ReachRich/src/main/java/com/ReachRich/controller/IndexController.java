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
public class IndexController {
	
	private static final Logger log = LoggerFactory.getLogger(IndexController.class);
	
	
	@RequestMapping(value="/index")
	public String indexGo(){
		return "/index";
	}

	@GetMapping("Ajax")
	public @ResponseBody String index() {
	    String url = "https://finance.naver.com/item/main.nhn?code=005930";
	    //ResponseEntity<String> entity = null;
	    log.info("컨트롤러 시동");
	    String entity ="";
	    try {
	        Document doc = Jsoup.connect(url).get();
	        Elements e1234 = doc.getElementsByAttributeValue("class", "no_today");
	        Elements e12345 = doc.getElementsByAttributeValue("class", "no_exday");
//	        String no = e12345.get(0).text();
//	        String[] no_exday = no.split(" ");
//	        for(int i=0; i<no_exday.length; i++) {
//	        	log.info("배열 : "+no_exday[i]);
//	        }
	        log.info("스판 : "+e12345.select("span"));
	        entity = e1234.select("span").get(0).text()+" "+e12345.select("span").get(1)+" "+e12345.select("span").get(2)+" "+e12345.select("span").get(9)+e12345.select("span").get(10)+e12345.select("span").get(14);
	        //entity += e1234.select("no_exday").get(0).text();
	        //entity = e1234.get(0).text();
	        //entity = new ResponseEntity<String>( e1234.select("span").get(0).text(),HttpStatus.OK);
	    } catch (Exception e) {
	        e.printStackTrace();
	        //entity = new ResponseEntity<String>(e.getMessage(),HttpStatus.BAD_REQUEST);
	    }
	    return entity;
	}
	@GetMapping("Ajax1")
	public @ResponseBody String index1() {
		//String kosp = "https://kr.investing.com/indices/kospi";
		String kosp = "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%EC%BD%94%EC%8A%A4%ED%94%BC%EC%A7%80%EC%88%98&oquery=%EB%82%98%EC%8A%A4%EB%8B%A5%EC%A7%80%EC%88%98&tqi=iZOXisp0J14ssuwgMv8ssssstvw-291903";
		//ResponseEntity<String> entity = null;
		String kospDE = "";
		Elements kosDE = null;
		log.info("컨트롤러 시동1");
		String entity ="";
		try {
			Document kospD = Jsoup.connect(kosp).get();
			kosDE = kospD.getElementsByAttributeValue("class", "spt_tlt");
			kospDE = kosDE+"";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return kospDE;
	}
	@GetMapping("kosDack")
	public @ResponseBody String KosDack() {
		String kosdack = "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%EC%BD%94%EC%8A%A4%EB%8B%A5%EC%A7%80%EC%88%98&oquery=%EC%BD%94%EC%8A%A4%ED%94%BC%EC%A7%80%EC%88%98&tqi=iZOyKdp0JXVss6POLRRssssstA0-520507";
		//ResponseEntity<String> entity = null;
		String kospDE = "";
		Elements kosDE = null;
		log.info("컨트롤러 시동1");
		String entity ="";
		try {
			Document kospD = Jsoup.connect(kosdack).get();
			kosDE = kospD.getElementsByAttributeValue("class", "spt_tlt");
			kospDE = kosDE+"";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return kospDE;
	}
	@GetMapping("NK")
	public @ResponseBody String NK() {
		String kosdack = "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%EB%8B%88%EC%BC%80%EC%9D%B4%EC%A3%BC%EC%8B%9D&oquery=NK%EC%A3%BC%EC%8B%9D&tqi=iZOXssp0YiRssjkcmx8ssssstq0-144058";
		//ResponseEntity<String> entity = null;
		String kospDE = "";
		Elements kosDE = null;
		log.info("컨트롤러 시동1");
		String entity ="";
		try {
			Document kospD = Jsoup.connect(kosdack).get();
			kosDE = kospD.getElementsByAttributeValue("class", "spt_tlt");
			kospDE = kosDE+"";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return kospDE;
	}
	@GetMapping("NasDack")
	public @ResponseBody String NasDack() {
		String nasdack = "https://search.naver.com/search.naver?sm=tab_sly.hst&where=nexearch&query=%EB%82%98%EC%8A%A4%EB%8B%A5%EC%A7%80%EC%88%98&oquery=%EC%82%BC%EC%84%B1%EC%A0%84%EC%9E%90+%EC%A3%BC%EA%B0%80&tqi=iZO0Sdp0Yidssv0ClowssssstrC-199206&acq=%EB%82%98%EC%8A%A4%EB%8B%A5+&acr=1&qdt=0";
		//ResponseEntity<String> entity = null;
		String kospDE = "";
		Elements kosDE = null;
		log.info("컨트롤러 시동1");
		String entity ="";
		try {
			Document kospD = Jsoup.connect(nasdack).get();
			kosDE = kospD.getElementsByAttributeValue("class", "spt_tlt");
			kospDE = kosDE+"";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return kospDE;
	}
	@GetMapping("JPY")
	public @ResponseBody String JPY() {
		String nasdack = "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%EC%97%94%ED%99%94&oquery=%EC%BD%94%EC%8A%A4%EB%8B%A5%EC%A7%80%EC%88%98&tqi=iZO2Bwp0YidssvxrMLNssssss28-231139";
		//ResponseEntity<String> entity = null;
		String kospDE = "";
		Elements kosDE = null;
		log.info("컨트롤러 시동1");
		String entity ="";
		try {
			Document kospD = Jsoup.connect(nasdack).get();
			kosDE = kospD.getElementsByAttributeValue("class", "rate_tlt");
			kospDE = kosDE+"";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return kospDE;
	}
	
	@GetMapping("USD")
	public @ResponseBody String USD() {
		String nasdack = "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%EB%8B%AC%EB%9F%AC&oquery=%EC%97%94%ED%99%94&tqi=iZOGZwp0JXVss6DLdQRssssstOG-046314";
		//ResponseEntity<String> entity = null;
		String kospDE = "";
		Elements kosDE = null;
		log.info("컨트롤러 시동1");
		String entity ="";
		try {
			Document kospD = Jsoup.connect(nasdack).get();
			kosDE = kospD.getElementsByAttributeValue("class", "rate_tlt");
			kospDE = kosDE+"";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return kospDE;
	}
	
	@GetMapping("CNY")
	public @ResponseBody String CNY() {
		String nasdack = "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%EC%9C%84%EC%95%88&oquery=%EB%8B%AC%EB%9F%AC&tqi=iZOIclp0Jy0ssjQZ5ANssssstWV-361909";
		//ResponseEntity<String> entity = null;
		String kospDE = "";
		Elements kosDE = null;
		log.info("컨트롤러 시동1");
		String entity ="";
		try {
			Document kospD = Jsoup.connect(nasdack).get();
			kosDE = kospD.getElementsByAttributeValue("class", "rate_tlt");
			kospDE = kosDE+"";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return kospDE;
	}
	
	@GetMapping("AUD")
	public @ResponseBody String AUD() {
		String nasdack = "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%ED%98%B8%EC%A3%BC%EB%8B%AC%EB%9F%AC&oquery=%EC%9C%84%EC%95%88&tqi=iZOJclp0J14ssu9wuSNssssstj4-487251";
		//ResponseEntity<String> entity = null;
		String kospDE = "";
		Elements kosDE = null;
		log.info("컨트롤러 시동1");
		String entity ="";
		try {
			Document kospD = Jsoup.connect(nasdack).get();
			kosDE = kospD.getElementsByAttributeValue("class", "rate_tlt");
			kospDE = kosDE+"";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return kospDE;
	}
	
	@GetMapping("SGD")
	public @ResponseBody String SGD() {
		String nasdack = "https://search.naver.com/search.naver?sm=tab_sug.top&where=nexearch&query=%EC%8B%B1%EA%B0%80%ED%8F%AC%EB%A5%B4+%EB%8B%AC%EB%9F%AC&oquery=%ED%98%B8%EC%A3%BC%EB%8B%AC%EB%9F%AC&tqi=iZOJLsp0Jy0ssjlSfiVssssstgK-040460&acq=%EC%8B%B1%EA%B0%80%ED%8F%B4+%EB%8B%A4&acr=1&qdt=0";
		//ResponseEntity<String> entity = null;
		String kospDE = "";
		Elements kosDE = null;
		log.info("컨트롤러 시동1");
		String entity ="";
		try {
			Document kospD = Jsoup.connect(nasdack).get();
			kosDE = kospD.getElementsByAttributeValue("class", "rate_tlt");
			kospDE = kosDE+"";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return kospDE;
	}
	
	@GetMapping("GBP")
	public @ResponseBody String GBP() {
		String nasdack = "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%ED%8C%8C%EC%9A%B4%EB%93%9C&oquery=%EC%8B%B1%EA%B0%80%ED%8F%AC%EB%A5%B4+%EB%8B%AC%EB%9F%AC&tqi=iZOJrsp0Jy0ssjBvDq0ssssssVC-280958";
		//ResponseEntity<String> entity = null;
		String kospDE = "";
		Elements kosDE = null;
		log.info("컨트롤러 시동1");
		String entity ="";
		try {
			Document kospD = Jsoup.connect(nasdack).get();
			kosDE = kospD.getElementsByAttributeValue("class", "rate_tlt");
			kospDE = kosDE+"";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return kospDE;
	}
	@GetMapping("EUR")
	public @ResponseBody String EUR() {
		String nasdack = "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%EC%9C%A0%EB%A1%9C&oquery=%ED%8C%8C%EC%9A%B4%EB%93%9C&tqi=iZO8idp0YiRssjsyLs8sssssslK-138900";
		//ResponseEntity<String> entity = null;
		String kospDE = "";
		Elements kosDE = null;
		log.info("컨트롤러 시동1");
		String entity ="";
		try {
			Document kospD = Jsoup.connect(nasdack).get();
			kosDE = kospD.getElementsByAttributeValue("class", "rate_tlt");
			kospDE = kosDE+"";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return kospDE;
	}
	@GetMapping("CHF")
	public @ResponseBody String CHF() {
		String nasdack = "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=CHF&oquery=%EC%8A%A4%EC%9C%84%EC%8A%A4+%EB%8B%AC%EB%9F%AC&tqi=iZO%2FXlp0JXossTBZdJossssst2V-146611";
		//ResponseEntity<String> entity = null;
		String kospDE = "";
		Elements kosDE = null;
		log.info("컨트롤러 시동1");
		String entity ="";
		try {
			Document kospD = Jsoup.connect(nasdack).get();
			kosDE = kospD.getElementsByAttributeValue("class", "rate_tlt");
			kospDE = kosDE+"";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return kospDE;
	}
	@GetMapping("HKD")
	public @ResponseBody String HKD() {
		String nasdack = "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%ED%99%8D%EC%BD%A9%EB%8B%A4%EB%9F%B4&oquery=CHF&tqi=iZO%2Fxdp0Jy0ssjQe6Nsssssstjs-106244";
		//ResponseEntity<String> entity = null;
		String kospDE = "";
		Elements kosDE = null;
		log.info("컨트롤러 시동1");
		String entity ="";
		try {
			Document kospD = Jsoup.connect(nasdack).get();
			kosDE = kospD.getElementsByAttributeValue("class", "rate_tlt");
			kospDE = kosDE+"";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return kospDE;
	}
	@GetMapping("THB")
	public @ResponseBody String THB() {
		String nasdack = "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=thb%ED%99%98%EC%9C%A8&oquery=%ED%83%9C%EA%B5%AD+%ED%99%98%EC%9C%A8&tqi=iZA2Qwp0Jy0sslruUAdssssstF8-477911";
		//ResponseEntity<String> entity = null;
		String kospDE = "";
		Elements kosDE = null;
		log.info("컨트롤러 시동1");
		String entity ="";
		try {
			Document kospD = Jsoup.connect(nasdack).get();
			kosDE = kospD.getElementsByAttributeValue("class", "rate_tlt");
			kospDE = kosDE+"";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return kospDE;
	}
	@GetMapping("INR")
	public @ResponseBody String INR() {
		String nasdack = "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=inr%ED%99%98%EC%9C%A8&oquery=thb%ED%99%98%EC%9C%A8&tqi=iZAIFwp0JywssdoRB7KssssssGl-242978";
		//ResponseEntity<String> entity = null;
		String kospDE = "";
		Elements kosDE = null;
		log.info("컨트롤러 시동1");
		String entity ="";
		try {
			Document kospD = Jsoup.connect(nasdack).get();
			kosDE = kospD.getElementsByAttributeValue("class", "rate_tlt");
			kospDE = kosDE+"";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return kospDE;
	}
	@GetMapping("RUB")
	public @ResponseBody String RUB() {
		String nasdack = "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=rub%ED%99%98%EC%9C%A8&oquery=cad%ED%99%98%EC%9C%A8&tqi=iZAJMsp0JywssdQ3SzVssssstes-368305";
		//ResponseEntity<String> entity = null;
		String kospDE = "";
		Elements kosDE = null;
		log.info("컨트롤러 시동1");
		String entity ="";
		try {
			Document kospD = Jsoup.connect(nasdack).get();
			kosDE = kospD.getElementsByAttributeValue("class", "rate_tlt");
			kospDE = kosDE+"";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return kospDE;
	}
	@GetMapping("CAD")
	public @ResponseBody String CAD() {
		String nasdack = "https://search.naver.com/search.naver?sm=tab_sug.ase&where=nexearch&query=cad%ED%99%98%EC%9C%A8&oquery=inr%ED%99%98%EC%9C%A8&tqi=iZAI2dp0YiRssQEajRlssssstNZ-071559&acq=cad%ED%99%98%EC%9C%A8&acr=1&qdt=0";
		//ResponseEntity<String> entity = null;
		String kospDE = "";
		Elements kosDE = null;
		log.info("컨트롤러 시동1");
		String entity ="";
		try {
			Document kospD = Jsoup.connect(nasdack).get();
			kosDE = kospD.getElementsByAttributeValue("class", "rate_tlt");
			kospDE = kosDE+"";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return kospDE;
	}
	@GetMapping("News")
	public @ResponseBody Elements News() {
		String nasdack = "https://news.naver.com/main/main.naver?mode=LSD&mid=shm&sid1=101";
		//ResponseEntity<String> entity = null;
		Elements kosDE = null;
		String kospDE = "";
		log.info("컨트롤러 시동1");
		String entity ="";
		try {
			Document kospD = Jsoup.connect(nasdack).get();
			kosDE = kospD.getElementsByAttributeValue("class", "aside");
			kospDE = kosDE.select("section _officeTopRanking1087474").text();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return kosDE;
	}
}
