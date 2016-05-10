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
 * �Թ��ﳵ��Ϣ�Ĳ�����
 * */
 
public class MyCartBODao {
	GetConnection gc=new GetConnection();
	ResultSet rs=null;
static //�����Ϣ
HashMap<String, String> hm=new HashMap<String, String>();
	/***
	 * ����Id���ػ��������
	 * **/
	public String geGoodsNumById(String goodsId){
		return hm.get(goodsId);
	}
	//���ﳵ���ܼ�
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
	
//ɾ����Ϣ
	public void del(String id){
		hm.remove(id);
	}
//�����Ϣ
	public void clear(){
		hm.clear();
	}
//������Ϣ
	public void update(String id,String newnum){
		hm.put(id, newnum);
	}

	/***
	 * ����HashMap����  ������
	 
	//�ӿ� Map<K,V>���Ͳ����� K - ��ӳ����ά���ļ������� V - ӳ��ֵ������
	 * ms=new HashMap <String ,MovieInfo>();
	 * **/
	 public static Map<String ,MovieInfo> ms=new HashMap <String ,MovieInfo>();
	 
	public static  Collection<MovieInfo> All(){
		return ms.values();
	}
	/****
	 * ��key value �Ե���ʽ�������*/
    MovieInfo add(MovieInfo a){
    	return ms.put(a.getId()+"", a);
    }
	/***
	 * ����Idɾ����Ϣ
	 * ****/
	String remove(int id){
    	return hm.remove(id);
    }
	/***
	 * ����Name��ѯ�۸�
	 * ***/
  /* double search (String name){
	   for(MovieInfo a :All()){
		   if(a.getName().equals(name)){
			   return a.getPrice();
		   }
		   
	   }
	return 0;
    	
    }*/
	
	//��ʾ���ﳵ
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
			System.out.println("�б�Ϊ��");
		}else{
			System.out.println("�б�Ϊ��");
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
	//��ʾ�õ����ݿ����ѧ����Ϣ��������������size���ض���ҳ

	public int getPageCount(int pageSize)
	{
		
		int pageCount = 0; 
		int rowCount=0;
		try  
		{	
		    rs = gc.Select("select count(*) from movieinfo");
			if(rs.next()){
				
			}
			rowCount = rs.getInt(1); //����Ŀ
			if(rowCount%pageSize==0){//������ ż��ҳ
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
	
	// ���з�ҳ
	public List<MovieInfo> getInfo(int pageSize,int pageCount ) //size page
	{
		int rowCount=(pageCount-1)*6;//��Ϣ�� ��
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
	
	
	
