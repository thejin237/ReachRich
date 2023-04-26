package Method;

import java.io.BufferedReader;
import java.io.ByteArrayInputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

import javax.xml.parsers.DocumentBuilderFactory;

import org.w3c.dom.Document;
import org.w3c.dom.Element;

public class Stock {
    public static void main(String[] args) {
        try {
            // API 요청 URL
            String urlString = "https://apis.data.go.kr/1160100/service/GetStockSecuritiesInfoService/getStockPriceInfo?serviceKey=6iQ4OgEVgYge8Kici7A2OIFWzZFEMK9n%2FUBKs3dCq%2FUUvYPHtNYEbjO7OfT1yzz6%2FoJKdxU0Wc4kiQtnywh0EQ%3D%3D&numOfRows=1&pageNo=1&resultType=xml&likeItmsNm=%EC%82%BC%EC%84%B1%EC%A0%84%EC%9E%90";

            // HTTP 요청 보내기
            HttpURLConnection con = (HttpURLConnection) new URL(urlString).openConnection();
            con.setRequestMethod("GET");

            // 응답 받기
            BufferedReader br = new BufferedReader(new InputStreamReader(con.getInputStream()));
            StringBuilder sb = new StringBuilder();
            String line;
            while ((line = br.readLine()) != null) {
                sb.append(line);
            }
            br.close();
            con.disconnect();

         // XML 파싱
            Document doc = DocumentBuilderFactory.newInstance().newDocumentBuilder().parse(
                    new ByteArrayInputStream(sb.toString().getBytes("UTF-8")));
            Element body = (Element) doc.getElementsByTagName("body").item(0);
            Element item = (Element) body.getElementsByTagName("item").item(0);

            // 센터 정보 출력
            System.out.println("종목 코드: " + item.getElementsByTagName("isinCd").item(0).getTextContent());
            System.out.println("종목명: " + item.getElementsByTagName("itmsNm").item(0).getTextContent());
            System.out.println("전일가: " + item.getElementsByTagName("clpr").item(0).getTextContent());
            System.out.println("전전일 대비: " + item.getElementsByTagName("vs").item(0).getTextContent());
            System.out.println("등락률:  " + item.getElementsByTagName("fltRt").item(0).getTextContent());
//            System.out.println("좌표: " + item.getElementsByTagName("lat").item(0).getTextContent() + ","
//                    + item.getElementsByTagName("lng").item(0).getTextContent());


        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}