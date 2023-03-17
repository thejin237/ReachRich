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

public class Ctest4 {

	public static void main(String[] args) throws IOException, SchedulerException {
		String url2 = "https://www.google.com/search?q=%EB%82%98%EC%8A%A4%EB%8B%A5&oq=%EB%82%98%EC%8A%A4%EB%8B%A5&aqs=chrome.0.0i131i355i433i512j46i131i199i433i465i512j0i131i433i512l4j0i512j0i131i433i512j0i512l2.1619j0j7&sourceid=chrome&ie=UTF-8";
		Document doc2 = Jsoup.connect(url2).get();
		Elements e12 = doc2.getElementsByAttributeValue("class", "uch-psvg");
		System.out.print(e12);




	}


}

