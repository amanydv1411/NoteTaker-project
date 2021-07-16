package com.servlets;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.entities.Note;
import com.helper.FactoryProvider;

/**
 * Servlet implementation class Edit_servlet
 */
public class Edit_servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			String tittle=request.getParameter("tittle");
			String content=request.getParameter("content");
			int id=Integer.parseInt(request.getParameter("note_id"));
			
			Session s=FactoryProvider.getFactory().openSession();
			Note note=s.get(Note.class,id);
			Transaction tx=s.beginTransaction();
			
			note.setContent(content);
			note.setTittle(tittle);
			note.setAddedDate(new Date());
			tx.commit();
			s.close();
			response.sendRedirect("all_notes.jsp");
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}

}
