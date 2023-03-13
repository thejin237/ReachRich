package com.ReachRich.Ctestkim;

import java.io.IOException;
import java.util.Timer;
import java.util.TimerTask;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.quartz.JobBuilder;
import org.quartz.JobDetail;
import org.quartz.Scheduler;
import org.quartz.SchedulerException;
import org.quartz.SchedulerFactory;
import org.quartz.SimpleScheduleBuilder;
import org.quartz.Trigger;
import org.quartz.TriggerBuilder;
import org.quartz.impl.StdSchedulerFactory;

public class Ctest {

	public static void main(String[] args) throws IOException, SchedulerException {
		String url = "https://finance.naver.com/item/main.naver?code=005930";
		Document doc = Jsoup.connect(url).get();
		Elements e1 = doc.getElementsByAttributeValue("class", "chart");
		Element e2 = e1.get(0);
		Elements e3 = e2.select("span");
		System.out.print(e1);




	}


}

