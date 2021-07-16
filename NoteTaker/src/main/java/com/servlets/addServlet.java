package com.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.entities.Note;
import com.helper.FactoryProvider;

/**
 * Servlet implementation class addServlet
 */
public class addServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			String tittle=request.getParameter("tittle");
			String content=request.getParameter("content");
			
			Note note=new Note(tittle,content,new Date());
			SessionFactory factory=FactoryProvider.getFactory();
			Session s=factory.openSession();
			Transaction tx=s.beginTransaction();
			
			s.save(note);
			tx.commit();
			s.close();
			response.setContentType("text/html");
			PrintWriter out=response.getWriter();
			out.print("<h2 style='text-align:center;'>Note is added succesfully</h2>");
			out.print("<h3 style='text-align:center';><a href='all_notes.jsp'> View all Notes");
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}

}
