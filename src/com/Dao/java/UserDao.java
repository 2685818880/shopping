package com.Dao.java;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import com.Bean.java.MovieInfo;
import com.Bean.java.User;
import com.getDataBaseConn.java.GetConnection;

public class UserDao {
	GetConnection con = new GetConnection();
	private String sql = "";
  
	/***
	 * login
	 * **/
	public boolean getLogin(String email, String password) throws Exception {

		// SQL注入
		/*
		 * sql = "select * from t_user where username='" + text1 +
		 * "'and password='" + text2 + "'"; Statement stat =
		 * con.createStatement(); ResultSet rs = stat.executeQuery(sql);
		 */

		sql = "select * from user where email=? and password=?";
		PreparedStatement pstat = con.prepare(sql);
		pstat.setString(1, email);
		pstat.setString(2, password);
		ResultSet rs = pstat.executeQuery();
		return rs.next();
	}
	
	  /* @see java.util.regex.Pattern
	   * 源码
	     * @since 1.4
	     * @spec JSR-51
	    public boolean matches(String regex) {
	        return Pattern.matches(regex, this);
	    }
	 */
	
	/** 判定是否为有效email        01 01 01*/
	public boolean isValidCell(String getEmail)
	{
		return getEmail.matches("[A-Z0-9a-z._%+-]+@[a-zA-Z0-9.-]+\\.[A-Za-z]{2,6}");
	}
	
	/***
	 * exists >0 已经存在
	 * ***/
	public boolean exists(String email) throws Exception {
		sql = "select count(*) from user where email='" + email + "'";
		ResultSet rs = con.Select(sql);
		rs.next();
		boolean exists = true;
		int count = rs.getInt(1); // 总条数
		// 0 1
		if (count > 0) {
			exists = false;
		} else {
			exists = true;
		}
		return exists;
	}

	/**
	 * insert into
	 * 
	 *  real_name,real_address,real_postcode,real_phone
	 */
	public void add(User user) throws SQLException {
		//insert into user(name,email,password) values('admin','admin','admin');
		sql = "insert into user(name,email,password,real_name,real_address,real_postcode,real_phone) values('" + user.getName()
				+ "','" + user.getEmail() + "','" + user.getPassword() + "','" 
				+ user.getReal_name() + "','" + user.getReal_address() + "','" 
				+ user.getReal_postcode() + "','" + user.getReal_phone() + "')";
		System.out.println(sql);
		con.Update(sql);
		/*
		 * sql="insert into user values(?,?,?)"; PreparedStatement pstat =
		 * con.prepare(sql); pstat.setString(1, user.getName());
		 * pstat.setString(2, user.getEmail()); pstat.setString(3,
		 * user.getPassword()); pstat.executeUpdate(); pstat.close();
		 */

	}
	private User user=null;
	public User findById(String u_email) {
		sql="select * from user where email='"+u_email+"'";
		System.out.println(sql);
		ResultSet rs=con.Select(sql);
				try {
					while(rs.next()){
						String name = null;
						int id = 0;
						String email=null;
						String password=null;
						String real_name=null;
						String real_address=null;
						String real_postcode=null;
						String real_phone=null;
						try {
							id=rs.getInt("id");
							name = rs.getString("name");
						    email=rs.getString("email");
						    password=rs.getString("password");
						    real_name = rs.getString("real_name");
						    real_address=rs.getString("real_address");
						    real_postcode=rs.getString("real_postcode");
						    real_phone=rs.getString("real_phone");

						} catch (SQLException e) {
							e.printStackTrace();
						}
						
						user=new User(id,name,email,password,real_name,real_address,real_postcode,real_phone);
					}
				} catch (SQLException e) {
					e.printStackTrace();
				}			
			return user;
				
	}
	/*User user=new User(id,  name,  email,  
					 real_name,  real_address,  real_postcode,
					 real_phone);*/
	public void update(User u) {
		String sql = "update User set name='"
				+u.getName() + "',email='"
				+ u.getEmail()+ "',real_name='"
				+u.getReal_name()+"',real_address='"
				+u.getReal_address()+"',real_postcode='"
				+u.getReal_postcode()+"',real_phone='"
				+u.getReal_phone()+"' where id="
				+ u.getId()+ "";
		System.out.println(sql);
		con.Update(sql);
	}
	/*public ArrayList<User> findById(String u_email) {
		list=new ArrayList<User>();
		sql="select * from user where email='"+u_email+"'";
		System.out.println(sql);
		ResultSet rs=con.Select(sql);
				try {
					while(rs.next()){
						String name = null;
						int id = 0;
						String email=null;
						String password=null;
						try {
							id=rs.getInt("id");
							name = rs.getString("name");
						    email=rs.getString("email");
						    password=rs.getString("password");
						} catch (SQLException e) {
							e.printStackTrace();
						}
						
						user=new User(id,name,email,password);
						list.add(user);
					}
				} catch (SQLException e) {
					e.printStackTrace();
				}			
			return list;
				
	}*/
}
