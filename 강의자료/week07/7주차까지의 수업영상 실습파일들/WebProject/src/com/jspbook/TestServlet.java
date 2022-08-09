package com.jspbook;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class TestServlet
 */
@WebServlet("/hs2")
public class TestServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public TestServlet() {
		super();
	}

	public void init(ServletConfig config) throws ServletException {
		System.out.println("init 호출1");
	}

	public void destroy() {
		System.out.println("destroy 호출");
	}

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println("<Html>");
		out.println("<HEAD><TITLE>Hello World Servlet</TITLE></HEAD>");
		out.println("<BODY><H2>Hello World Servlet : 헬로월드</H2></BODY>");
		out.println("</HTML>");

	}

}
