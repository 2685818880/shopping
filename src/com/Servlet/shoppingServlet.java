package com.Servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Bean.java.MovieInfo;
import com.Dao.java.AdminDao;
import com.Dao.java.MyCartBODao;


@SuppressWarnings("serial")
public class shoppingServlet extends HttpServlet{
	float price=0;float temp = 0;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		doPost(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String m = req.getParameter("m");
		// MyCartBODao mbo=new MyCartBODao();

		// 试图从session中取出一个购物车。
		MyCartBODao mbo = (MyCartBODao) req.getSession().getAttribute("mycart");
		if (mbo == null) {// 若果没有，则表明是第一次购物
			// 创建一个购物车，并放入session.
			mbo = new MyCartBODao();

			req.getSession().setAttribute("mycart", mbo);
		}
		if ("add".equals(m)) {
			
			/*if(price!=0){
				price+=price;
			}*/
			
          /*  price=temp+Float.parseFloat(req.getParameter("price"));
            temp=price;*/
			String id = req.getParameter("id");// 获得购物的id

			mbo.add(id, "1");// 默认购买1本书，以后修改
			//req.setAttribute("price", price);
			//req.getSession().setAttribute("price", temp);
           
		}else if("del".equals(m)){
	         /* price=temp-Float.parseFloat(req.getParameter("price"));
	          temp=price;*/
			String id = req.getParameter("id");// 获得购物的id
			mbo.del(id);
			//req.getSession().setAttribute("price", temp);
			//price-=price;
		}else if("delAll".equals(m)){
			mbo.clear();
			/*temp=0;
			req.getSession().setAttribute("price", temp);*/

		}else if("updateGoods".equals(m)){
			String goodsId[]=req.getParameterValues("goodsId");
			String newNums[]=req.getParameterValues("newNums");
			for(int i=0;i<goodsId.length;i++){
				System.out.println(goodsId[i]+"----------"+newNums[i]+"--");
				mbo.update(goodsId[i], newNums[i]);
			}
		}

		ArrayList<MovieInfo> list = mbo.showMycart();
		req.setAttribute("list", list);

		req.getRequestDispatcher("buy_view.jsp").forward(req, resp);
	}	

}
