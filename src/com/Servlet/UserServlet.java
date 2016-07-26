package com.Servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.Bean.java.MovieInfo;
import com.Bean.java.User;
import com.Dao.java.MyCartBODao;
import com.Dao.java.UserDao;
import com.Util.java.CodeController;

@SuppressWarnings("serial")
public class UserServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		super.doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String m = req.getParameter("m");
		if ("login".equals(m)) {
			try {
				login(req, resp);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else if ("regist".equals(m)) {
			regist(req, resp);
		} else if ("update".equals(m)) {
			update(req, resp);
		} else if ("buy_login".equals(m)) {
			buy_login(req, resp);
		} else if ("buy_order".equals(m)) {
			buy_order(req, resp);
		}
		System.out.print(m);
	}

	private void buy_order(HttpServletRequest req, HttpServletResponse resp) {
		MyCartBODao mbo = (MyCartBODao) req.getSession().getAttribute("mycart");
		// ArrayList<MovieInfo> list = mbo.showMycart();
		String num = "0000" + "l" + "0";
		req.setAttribute("num", num);

		float allPrice = mbo.getAllPrice();
		System.out.println(allPrice);
		req.setAttribute("list", allPrice);

		String u_email = req.getParameter("email");
		UserDao ud = new UserDao();
		User user = ud.findById(u_email);

		req.setAttribute("user", user);
		System.out.println(user + "----------");
		try {
			req.getRequestDispatcher("buy_orderfinish.jsp").forward(req, resp);
		} catch (ServletException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

	}

	private void buy_login(HttpServletRequest req, HttpServletResponse resp) {
		try {
			req.getRequestDispatcher("buy_login.jsp").forward(req, resp);
		} catch (ServletException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	private void update(HttpServletRequest req, HttpServletResponse resp) {
		try {
			int id = Integer.parseInt(req.getParameter("id"));
			String name = req.getParameter("name");
			String email = req.getParameter("email");
			String real_name = req.getParameter("real_name");
			String real_address = req.getParameter("real_address");
			String real_postcode = req.getParameter("real_postcode");
			String real_phone = req.getParameter("real_phone");

			System.out.println("update--" + id + "--" + name + "--" + email
					+ "" + real_name + "" + real_address + "" + real_postcode
					+ "" + real_phone);
			User user = new User(id, name, email, real_name, real_address,
					real_postcode, real_phone);
			/*
			 * user.setId(id); user.setEmail(email); user.setName(name);
			 */

			UserDao ud = new UserDao();
			ud.update(user);
			req.setAttribute("user", user);

			MyCartBODao mbo = (MyCartBODao) req.getSession().getAttribute(
					"mycart");
			ArrayList<MovieInfo> list = mbo.showMycart();
			req.setAttribute("list", list);

			req.getRequestDispatcher("buy_cardinfo.jsp").forward(req, resp);
		} catch (ServletException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	private void regist(HttpServletRequest req, HttpServletResponse resp) {
		UserDao user = new UserDao();
		String name = req.getParameter("username");
		String email = req.getParameter("email");
		String password = req.getParameter("password");
		String code = req.getParameter("code");
		String real_name = "";
		String real_address = "";
		String real_postcode = "";
		String real_phone = "";
		System.out.println(code);
		// CodeController c=new CodeController();
		/*
		 * c.getRandcode(req, resp); Object attribute =
		 * req.getAttribute("code"); if(attribute!=code){
		 * req.setAttribute("info", "code error"); try {
		 * req.getRequestDispatcher("regist.jsp").forward(req, resp); } catch
		 * (ServletException e) { e.printStackTrace(); } catch (IOException e) {
		 * e.printStackTrace(); } }
		 */
		User u = new User(name, email, password, real_name, real_address,
				real_postcode, real_phone);
		try {

			Pattern regex = Pattern
					.compile("[A-Z0-9a-z._%+-]+@[a-zA-Z0-9.-]+\\.[A-Za-z]{2,6}");
			Matcher matcher = regex.matcher(email);
			if (!matcher.find()) {
				req.setAttribute("info", "email format error");
				req.getRequestDispatcher("regist.jsp").forward(req, resp);
			} else {
				if (user.exists(email)) {
					if (u != null && !email.equals("") && email != null
							&& !name.equals("") && !password.equals("")
							&& name != null && password != null) {
						user.add(u);
						req.getRequestDispatcher("buy_login.jsp").forward(req,
								resp);
					} else {
						req.setAttribute("info", "email,name,password not null");
						req.getRequestDispatcher("regist.jsp").forward(req,
								resp);
					}
				} else {
					req.setAttribute("info", "email already ");
					req.getRequestDispatcher("regist.jsp").forward(req, resp);
				}
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ServletException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private void login(HttpServletRequest req, HttpServletResponse resp)
			throws Exception, IOException {

		System.out.println(000);
		UserDao user = (UserDao) req.getSession().getAttribute("users");
		// 将用户信息保存到session
		String email = null;
		String password ;
		 email = req.getParameter("email");
		 password = req.getParameter("password");
		if (user == null) {
			System.out.println(222);
			user = new UserDao();

			req.getSession().setAttribute("users", user);

			

			if (!user.getLogin(email, password)) {
				System.out.println(111);
				req.getRequestDispatcher("buy_login.jsp").forward(req, resp);
			}
		}

			else {
				System.out.println(333);
				// ArrayList<User> findById = (ArrayList<User>)
				// user.findById(email);
				User findById = user.findById(email);
				System.out.println(findById);
				req.setAttribute("user", findById);

				HttpSession session = req.getSession(true);
				session.setAttribute("users", user);
                System.out.println(user);
				MyCartBODao mbo = (MyCartBODao) req.getSession().getAttribute(
						"mycart");
				if (mbo == null) {
					req.getRequestDispatcher("index.jsp").forward(req, resp);
				} else {
					// System.out.println(mbo+"mbo---------------------");
					ArrayList<MovieInfo> list = mbo.showMycart();
					float allPrice = mbo.getAllPrice();
					System.out.println(allPrice);
					// mb.geGoodsNumById(goodsId);
					req.setAttribute("list", list);

					System.out.println(list + "list--------------------");
					req.getRequestDispatcher("buy_cardinfo.jsp").forward(req,
							resp);
				}
			}
		}
		/*
		 * // ,ServletRequest session
		 *//**
		 * 从session中取用户信息
		 */
		/*
		 * UserDao user = (UserDao) req.getSession().getAttribute("users");
		 * 
		 * if (user != null) {// 用户没有登录 System.out.println(user);
		 * req.setAttribute("info", "email format error11"); try {
		 * req.getRequestDispatcher("buy_login.jsp").forward(req, resp); } catch
		 * (ServletException e) { // TODO Auto-generated catch block
		 * e.printStackTrace(); } catch (IOException e) { // TODO Auto-generated
		 * catch block e.printStackTrace(); }
		 * 
		 * } else {
		 * 
		 * // 试图从session user
		 * 
		 * if (user == null) {
		 * 
		 * user = new UserDao();
		 * 
		 * // /////////////////////////////////////////////////////////////// //
		 * UserDao user = new UserDao(); String email =
		 * req.getParameter("email"); String password =
		 * req.getParameter("password"); if (email.isEmpty() || email == null) {
		 * req.getRequestDispatcher("buy_login.jsp").forward(req, resp); } else
		 * { try { Pattern regex = Pattern
		 * .compile("[A-Z0-9a-z._%+-]+@[a-zA-Z0-9.-]+\\.[A-Za-z]{2,6}"); Matcher
		 * matcher = regex.matcher(email); if (!matcher.find()) {
		 * req.setAttribute("info", "email format error22");
		 * req.getRequestDispatcher("buy_login.jsp").forward( req, resp); } else
		 * { if (user.getLogin(email, password)) { // ArrayList<User> findById =
		 * (ArrayList<User>) // user.findById(email); User findById =
		 * user.findById(email); System.out.println(findById);
		 * req.setAttribute("user", findById);
		 * 
		 * req.getSession().setAttribute("users", user); // MyCartBODao mb=new
		 * MyCartBODao(); // ArrayList<MovieInfo> showMycart = //
		 * mb.showMycart(); //
		 * System.out.println(showMycart+"-----------------------");
		 * 
		 * MyCartBODao mbo = (MyCartBODao) req
		 * .getSession().getAttribute("mycart"); if (mbo == null) {
		 * req.getRequestDispatcher("index.jsp") .forward(req, resp); } else {
		 * // System.out.println(mbo+"mbo---------------------");
		 * ArrayList<MovieInfo> list = mbo .showMycart(); float allPrice =
		 * mbo.getAllPrice(); System.out.println(allPrice); //
		 * mb.geGoodsNumById(goodsId); req.setAttribute("list", list);
		 * 
		 * System.out.println(list + "list--------------------");
		 * req.getRequestDispatcher("buy_cardinfo.jsp") .forward(req, resp); } }
		 * else { req.setAttribute("info", "email,password out error");
		 * req.getRequestDispatcher("buy_login.jsp") .forward(req, resp); } } }
		 * catch (ServletException e) { e.printStackTrace(); } catch
		 * (IOException e) { e.printStackTrace(); } catch (Exception e) {
		 * e.printStackTrace(); } } } }
		 */
	}
