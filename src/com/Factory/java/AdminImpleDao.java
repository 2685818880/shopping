package com.Factory.java;

import java.util.List;

import com.Bean.java.MovieInfo;
public interface AdminImpleDao {
	void add(MovieInfo MovieInfo_info);
	void del(String MovieInfo_Id);
	void update(MovieInfo MovieInfo_info);
	List<MovieInfo> findAll();
	MovieInfo findById(int MovieInfo_Id);
}
