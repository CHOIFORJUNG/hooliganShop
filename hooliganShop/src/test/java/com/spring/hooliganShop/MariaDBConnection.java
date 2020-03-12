package com.spring.hooliganShop;

import java.sql.Connection;
import java.sql.DriverManager;

import org.junit.Test;

public class MariaDBConnection {
	
	private static final String DRIVER = 
			"org.mariadb.jdbc.Driver";
	private static final String URL = 
			"jdbc:mariadb://localhost:3306/hooligan_shop";
	private static final String USER = 
			"root";
	private static final String PWD =
			"0000";
	
	@Test
	public void testConn() throws Exception{
		Class.forName(DRIVER);
		
		try(Connection conn = DriverManager.getConnection(URL, USER, PWD)){
			System.out.println(conn);
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	
}
