package com.connection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import oracle.jdbc.OracleDriver;

public class DatabaseConnection {

	public static Connection connection;

	public static Connection getConnection() {
		try {
                    DriverManager.registerDriver(new OracleDriver());
			connection = DriverManager.getConnection("jdbc:oracle:thin:@LAPTOP-78RVQ4D9:1521:orcl", "sushanta", "karmakar");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return (connection);
	}

	public static void CloseConnection() {
		if (connection != null) {
			try {
				connection.close();
			} catch (SQLException ex) {
				ex.printStackTrace();
			}
		}
	}

	public static ResultSet getResultFromSqlQuery(String SqlQueryString) {
		ResultSet rs = null;
		try {
			if (connection == null) {
				getConnection();
			}
			rs = connection.createStatement().executeQuery(SqlQueryString);
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return rs;
	}

	public static int insertUpdateFromSqlQuery(String SqlQueryString) {
		int i = 2;
		try {
			if (connection == null) {
				getConnection();
			}
			i = connection.createStatement().executeUpdate(SqlQueryString);

		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return i;
	}
	
	public static String generatePatientId() {
		String vid = null;
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddhhmmss");
		vid = sdf.format(new Date());
		vid = "P" + vid;
		System.out.println("Patient Id " + vid);
		return vid;
	}
	
	public static String generateDriverId() {
		String did = null;
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddhhmmss");
		did = sdf.format(new Date());
		did = "D" + did;
		System.out.println("Driver Id " + did);
		return did;
	}
	
	public static String generateAmbulanceId() {
		String aid = null;
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddhhmmss");
		aid = sdf.format(new Date());
		aid = "AVN" + aid;
		System.out.println("Driver Id " + aid);
		return aid;
	}
}
