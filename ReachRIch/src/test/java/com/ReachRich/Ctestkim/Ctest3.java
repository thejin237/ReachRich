package com.ReachRich.Ctestkim;

import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.quartz.Scheduler;

public class Ctest3 {
  public static void main(String[] args) {
    ScheduledExecutorService scheduler = Executors.newSingleThreadScheduledExecutor();
   scheduler.scheduleAtFixedRate(() -> {
      try {
        String url2 = "https://finance.naver.com/item/main.naver?code=005930";
        Document doc2 = Jsoup.connect(url2).get();
        Elements e12 = doc2.getElementsByAttributeValue("class", "chart");
        System.out.println(e12);
      } catch (Exception e) {
        e.printStackTrace();
      }
    }, 0, 5, TimeUnit.SECONDS);
  }
}