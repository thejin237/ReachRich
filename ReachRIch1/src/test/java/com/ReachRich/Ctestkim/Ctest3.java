package com.ReachRich.Ctestkim;

import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;

import net.bytebuddy.agent.VirtualMachine.ForHotSpot.Connection.Response;

public class Ctest3 {
  public static void main(String[] args) {
    ScheduledExecutorService scheduler = Executors.newSingleThreadScheduledExecutor();
    Elements stock = null;
    scheduler.scheduleAtFixedRate(() -> {
	   try {
        String url2 = "https://finance.naver.com/item/main.naver?code=005930";
        Document doc2 = Jsoup.connect(url2).get();
        Elements e12 = doc2.getElementsByAttributeValue("class", "chart");
        Elements e123 = doc2.getElementsByAttributeValue("img", "img_chart_area");
        //Elements e1234 = doc2.getElementsByAttributeValue("class", "no_up");
        Elements e1234 = doc2.getElementsByAttributeValue("class", "no_today");
        //stock = doc2.getElementsByAttributeValue("class", "chart");
        //Elements e1234 = doc2.getElementsByAttributeValue("class", "blind");
        System.out.println(e1234.select("span").get(0).text());
        
      } catch (Exception e) {
        e.printStackTrace();
      }
    }, 0, 5, TimeUnit.SECONDS);
  }
}