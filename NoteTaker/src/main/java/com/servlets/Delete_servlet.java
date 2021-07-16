package com.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.entities.Note;
import com.helper.FactoryProvider;

/**
 * Servlet implementation class Delete_servlet
 */
public class Delete_servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			int note_id=Integer.parseInt(request.getParameter("note_id"));
			
			Session s=FactoryProvider.getFactory().openSession();
			Note del_note=s.get(Note.class, note_id);
			Transaction tx=s.beginTransaction();
			
			s.delete(del_note);
			tx.commit();
			s.close();
			
			response.sendRedirect("all_notes.jsp");
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
	}

}
