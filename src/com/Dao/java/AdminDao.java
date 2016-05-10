package com.Dao.java;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.Bean.java.MovieInfo;
import com.Factory.java.AdminImpleDao;
import com.getDataBaseConn.java.GetConnection;

public class AdminDao implements AdminImpleDao{

       GetConnection sqlcon=new GetConnection();
       private String sql="";
	   private MovieInfo mo;
	   
		@Override
		public void add(MovieInfo mi) {
			//String file, float price, String intro, String day
			//insert into MovieInfo(file,price,intro,day)
            //values('1.jpg','89.9','this very good','2015-11-26');
			sql = "insert into MovieInfo (file,price,intro,day) values ('"
					+ mi.getFile() + "','" + mi.getPrice() + "','" + mi.getIntro() + "','" + mi.getDay() + "')";
			System.out.print(sql);
			sqlcon.Update(sql);
		}
		@Override
		public void del(String id) {
			String sql = "delete from MovieInfo where id=" + id + "";
			sqlcon.Update(sql);
		}

		@Override
		public void update(MovieInfo mi) {
			String sql = "update MovieInfo set file='"
					+mi.getFile() + "',price='"
					+ mi.getPrice()+ "',day='"
					+ mi.getDay()+ "' where id="
					+ mi.getId()+ "";
			sqlcon.Update(sql);
		}

		@Override
		public List<MovieInfo> findAll() {
			List<MovieInfo> list=new ArrayList<MovieInfo>();
			
			sql="select * from MovieInfo";
			ResultSet rs=sqlcon.Select(sql);

			try {
				while(rs.next()){
				int id=Integer.parseInt( rs.getString("id"));
				String file=rs.getString("file");
				float price =rs.getFloat("price");
				String intro=rs.getString("intro");
				String day=rs.getString("day");
				MovieInfo s=new MovieInfo(id,file,price,intro,day);
				list.add(s);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return list;
		}
	
		@Override
		public MovieInfo findById(int fid) {
			sql="select * from MovieInfo where id="+fid+"";
			ResultSet rs=sqlcon.Select(sql);
				try {
					while(rs.next()){
						int id=Integer.parseInt( rs.getString("id"));
						String file=rs.getString("file");
						float price =rs.getFloat("price");
						String intro=rs.getString("intro");
						String day=rs.getString("day");
						mo=new MovieInfo(id,file,price,intro,day);
					
					}
				} catch (SQLException e) {
				}
				return mo;
					
		}
		
}



