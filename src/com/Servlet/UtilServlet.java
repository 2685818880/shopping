package com.Servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Bean.java.MovieInfo;
import com.Util.java.CodeController;

@SuppressWarnings("serial")
public class UtilServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		super.doPost(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String m = req.getParameter("m");
		if ("code".equals(m)) {
			code(req, resp);
			//CodeController c=new CodeController();
		//	c.getRandcode(req, resp);
		//	ArrayList<MovieInfo> list = mbo.showMycart();
		//	req.setAttribute("list", list);

		//	req.getRequestDispatcher("buy_view.jsp").forward(req, resp);
		}
	}
	private void code(HttpServletRequest req, HttpServletResponse resp) {
		CodeController c=new CodeController();
		c.getRandcode(req, resp);
		Object attribute = req.getAttribute("code");
		if(attribute!=null){
			req.setAttribute("code",attribute );
			try {
				req.getRequestDispatcher("authcode.jsp").forward(req, resp);
			} catch (ServletException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
}
