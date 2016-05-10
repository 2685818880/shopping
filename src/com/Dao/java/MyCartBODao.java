package com.Dao.java;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import com.Bean.java.MovieInfo;
import com.getDataBaseConn.java.GetConnection;
/**
 * 对购物车信息的操作。
 * */
 
public class MyCartBODao {
	GetConnection gc=new GetConnection();
	ResultSet rs=null;
static //添加信息
HashMap<String, String> hm=new HashMap<String, String>();
	/***
	 * 根据Id返回货物的数量
	 * **/
	public String geGoodsNumById(String goodsId){
		return hm.get(goodsId);
	}
	//购物车的总价
	private float allPrice=0.0f;
	
	public float getAllPrice() {
		return this.allPrice;
	}

	public void setAllPrice(float allPrice) {
		this.allPrice = allPrice;
	}

	public void add(String id,String num){
		hm.put(id, num);
	}
	
//删除信息
	public void del(String id){
		hm.remove(id);
	}
//清空信息
	public void clear(){
		hm.clear();
	}
//更新信息
	public void update(String id,String newnum){
		hm.put(id, newnum);
	}

	/***
	 * 根据HashMap特性  测试用
	 
	//接口 Map<K,V>类型参数： K - 此映射所维护的键的类型 V - 映射值的类型
	 * ms=new HashMap <String ,MovieInfo>();
	 * **/
	 public static Map<String ,MovieInfo> ms=new HashMap <String ,MovieInfo>();
	 
	public static  Collection<MovieInfo> All(){
		return ms.values();
	}
	/****
	 * 以key value 对的形式存放数据*/
    MovieInfo add(MovieInfo a){
    	return ms.put(a.getId()+"", a);
    }
	/***
	 * 根据Id删除信息
	 * ****/
	String remove(int id){
    	return hm.remove(id);
    }
	/***
	 * 根据Name查询价格
	 * ***/
  /* double search (String name){
	   for(MovieInfo a :All()){
		   if(a.getName().equals(name)){
			   return a.getPrice();
		   }
		   
	   }
	return 0;
    	
    }*/
	
	//显示货物车
	public ArrayList<MovieInfo> showMycart(){
		ArrayList<MovieInfo> list=new ArrayList<MovieInfo>();
		String sql="select * from movieinfo where id in";
		System.out.println(sql);
		Iterator<String> it=hm.keySet().iterator();
		String sub="(";

		 boolean f=false;
		while(it.hasNext()){
			f=true;
			String id=(String)it.next();
			System.out.println(id);
			if(it.hasNext()){
				sub+=id+",";
			}else{
				sub+=id+")";
			}
		}
		System.out.println(f);
		if(f){
			f=false;
			System.out.println("列表不为空");
		}else{
			System.out.println("列表为空");
			sub+="null"+")";
		}
		sql+=sub;
		System.out.println(sql);
		rs=gc.Select(sql);
      
		try {
			this.allPrice=0.0f;
			while(rs.next()){
				
				MovieInfo mov=new MovieInfo();
				int goodsId=rs.getInt(1);
				mov.setId(goodsId);
				mov.setFile(rs.getString(2));
				float unit=rs.getFloat(3);
				mov.setPrice(unit);
				mov.setIntro(rs.getString(4));
				mov.setDay(rs.getString(5));
				this.allPrice=this.allPrice+unit*Integer.parseInt(this.geGoodsNumById(goodsId+""));
				
			list.add(mov);
			
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return list;
	}
	//显示得到数据库表里学生信息的总条数，根据size返回多少页

	public int getPageCount(int pageSize)
	{
		
		int pageCount = 0; 
		int rowCount=0;
		try  
		{	
		    rs = gc.Select("select count(*) from movieinfo");
			if(rs.next()){
				
			}
			rowCount = rs.getInt(1); //总数目
			if(rowCount%pageSize==0){//被整除 偶数页
				pageCount=rowCount/pageSize;
			}else{
				pageCount=rowCount/pageSize+1;
			}
		} 
		catch (SQLException e) 
		{
			e.printStackTrace();
		}
		
		return pageCount;
	}
	
	// 进行分页
	public List<MovieInfo> getInfo(int pageSize,int pageCount ) //size page
	{
		int rowCount=(pageCount-1)*6;//信息行 数
		String sql="select * from movieinfo limit "+rowCount+","+pageSize+"";
		System.out.print(sql);
		rs=gc.Select(sql);
		MovieInfo use=null;
		List<MovieInfo> list=new ArrayList<MovieInfo>();
		try {
			while(rs.next()){
				int id=rs.getInt(1);
				String file=rs.getString(2);
				float price=rs.getFloat(3);
				String intro=rs.getString(4);
				String  day=rs.getString(5);
				use=new MovieInfo(id,  file, price,  intro,  day);
				list.add(use);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;

	}




}
	
	
	
