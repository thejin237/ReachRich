package com.reachrich.demo;

import java.sql.Connection;
import java.sql.DriverManager;

public class DAO {
	Connection conn = null;
	
	public void tryConnection() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/","root","1234");
		}catch(Exception e) {
			e.printStackTrace();
		}
		System.out.println("conn : " + conn);
	}
}
