package com.getDataBaseConn.java;

import java.sql.*;


public class GetConnection {
	Connection con = null;
	Statement stat =null;
	public  Connection getConnection(){
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/shopping","root","root");
		} catch (ClassNotFoundException e) {
			  
			e.printStackTrace();
		} catch (SQLException e) {
			 
			e.printStackTrace();
		}
		return con;
	}
	public void Update(String sql){
		try {
			stat=getConnection().createStatement();
			stat.executeUpdate(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		}  try {
			stat.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		   try {
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
			
		}
		
		public ResultSet Select(String sql){
			try {
				stat=getConnection().createStatement();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			ResultSet rs = null;
			try {
				rs = stat.executeQuery(sql);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			if(getConnection()!=null){
			try {
				getConnection().close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			}return rs;

		}
		public PreparedStatement prepare(String sql){
			PreparedStatement preparestat=null;
			try {
				preparestat=getConnection().prepareStatement(sql);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return  preparestat;

			}
	
}
