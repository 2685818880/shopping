package com.Servlet;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.logging.SimpleFormatter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.Bean.java.MovieInfo;
import com.Dao.java.AdminDao;
import com.Dao.java.MyCartBODao;

public class Upload extends HttpServlet {
	/**
	 * 
	 */
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String m = req.getParameter("m");
		if ("insert_info".equals(m)) {
			insert_info(req, resp);
		} else if ("list".equals(m)) {
			list(req, resp);
		} else if ("show_view".equals(m)) {
		   show_view(req, resp);
		} else if ("show_page".equals(m)) {
			show_page(req, resp);
		}

		System.out.print(m);
	}


	private void show_page(HttpServletRequest req, HttpServletResponse resp) {
		String pageNow =req.getParameter("pageNow");
		System.out.print(pageNow);
		req.setAttribute("pageCount", pageNow);
		try {
			req.getRequestDispatcher("index.jsp").forward(req, resp);
		} catch (Exception e) {
			e.printStackTrace();

		}
	}


	private void show_view(HttpServletRequest req, HttpServletResponse resp)
			{
		int id = Integer.parseInt(req.getParameter("id"));
		AdminDao stud = new AdminDao();
		MovieInfo mov = stud.findById(id);
		req.setAttribute("show_view", mov);
		try {
			req.getRequestDispatcher("show_view.jsp").forward(req, resp);
		} catch (ServletException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	private void list(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			AdminDao stud = new AdminDao();
			List<MovieInfo> stu = stud.findAll();
			req.setAttribute("s", stu);
			req.getRequestDispatcher("view.jsp").forward(req, resp);
	}

	void insert_info(HttpServletRequest request, HttpServletResponse response) {
		// String p=request.getParameter("price");
		// float price =Float.parseFloat(p);
		// String intro = request.getParameter("intro");

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss SSS");
		String time = sdf.format(new Date()).trim().toString();
		// System.out.print(p+""+intro+""+time);

		FileItemFactory fif = new DiskFileItemFactory();
		ServletFileUpload sfu = new ServletFileUpload(fif);
		List<FileItem> fi = null;
		try {

			fi = sfu.parseRequest(request);

		} catch (FileUploadException e) {
			e.printStackTrace();
		}
		int ss=(int) (Math.random()*100);
		String s = ss+".jpg";
		for (FileItem fileItem : fi) {
			try {
				//s = fileItem.getName();
				///System.out.println(s.getClass().getName());
				//D:\demo\Shopping\WebContent\images
				//File f = new File("F:\\gw\\" + s + "");
				File f = new File("D:/demo/Shopping/WebContent/images/" + s + "");
				fileItem.write(f);
				float price = 89.0f;
				String intro = "this is good";
				AdminDao ad = new AdminDao();
				System.out.print(s);
				String file = s;
				// String file, float price, String intro, String day
				MovieInfo st = new MovieInfo(file, price, intro, time);
				System.out.print(st);
				ad.add(st);

				String oo = "uploat success!";
				request.setAttribute("oo", oo);
				request.getRequestDispatcher("upload.jsp").forward(request,
						response);
			} catch (Exception e) {
				e.printStackTrace();
			}

		}

	}

}
