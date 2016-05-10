package com.Servlet;

import java.io.IOException;
import java.util.Collection;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Bean.java.MovieInfo;
import com.Dao.java.MyCartBODao;

public class test extends HttpServlet{
@Override
protected void doGet(HttpServletRequest req, HttpServletResponse resp)
		throws ServletException, IOException {
	// TODO Auto-generated method stub
	super.doPost(req, resp);
}
@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
	String m=req.getParameter("m");
	if("all".equals(m)){
		all(req,resp);
	}
	}
private void all(HttpServletRequest req, HttpServletResponse resp) {
	// TODO Auto-generated method stub
	Collection<MovieInfo> all = MyCartBODao.All();
	System.out.println(all);
}
}
