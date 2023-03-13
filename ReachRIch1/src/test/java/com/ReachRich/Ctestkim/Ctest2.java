package com.ReachRich.Ctestkim;

import java.io.IOException;
import java.util.Timer;
import java.util.TimerTask;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

public class Ctest2 {

	public static void main(String[] args) throws IOException {
		String url = "https://news.naver.com/main/list.naver?mode=LS2D&mid=shm&sid1=101&sid2=259";
		Document doc = Jsoup.connect(url).get();
		Elements e1 = doc.getElementsByAttributeValue("class", "type06_headline");
		Element e2 = e1.get(0);
		//Elements e3 = e2.select("span");
		//System.out.print(e3.get(0).text());
		System.out.print(e1);

	}
	


}
