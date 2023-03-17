package com.ReachRich.Ctestkim;
import org.json.*;
//import urllib.request;

public class Stock {
	String key = "6iQ4OgEVgYge8Kici7A2OIFWzZFEMK9n%2FUBKs3dCq%2FUUvYPHtNYEbjO7OfT1yzz6%2FoJKdxU0Wc4kiQtnywh0EQ%3D%3D";
	String url = "https://apis.data.go.kr/1160100/service/GetStockSecuritiesInfoService/getStockPriceInfo?serviceKey="
			+key
			+"&numOfRows=10&pageNo=10&resultType=json";
	String u1 = "https://apis.data.go.kr/1160100/service/GetStockSecuritiesInfoService/getStockPriceInfo?serviceKey="
			+ key
			+ "&numOfRows=1&pageNo=1&resultType=json&likeItmsNm=%EC%82%BC%EC%84%B1";
}
