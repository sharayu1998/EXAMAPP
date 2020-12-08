package com.examination.servlets;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.examination.controller.MarksCrud;
import com.examination.controller.QuestionsCrud;
import com.examination.models.Marks;
import com.examination.models.Questions;
import com.examination.models.Users;


@WebServlet("/resultServlet")
public class ResultServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public ResultServlet() {
        super();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		this.doPost(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession(false);
		if (session != null) {
			Users user = (Users) session.getAttribute("user");
			if(user.getRole().equalsIgnoreCase("student")) {
				List<Questions> questions = QuestionsCrud.getAllQuestion();
				int marks = 0;
				for(Questions question : questions) {
					if (question.getCorrect_answer().equalsIgnoreCase(request.getParameter(question.getQid() + "option"))) {
						marks += 1 ;
					}
				}
				
				Marks m = new Marks(user.getUserid(), marks);
				MarksCrud.registerMarks(m);
				response.sendRedirect("student.jsp");
			}
		
		}
	}

}
