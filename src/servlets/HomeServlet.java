package servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class HomeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public HomeServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try{
		if(request.getSession().getAttribute("usuario")!=null){
			if(request.getParameter("borrar") != null){
//				request.getSession().invalidate();
				LimpiarSession.deleteSession(request);
			}
			request.setAttribute("usuario", request.getSession().getAttribute("usuario"));
		}
		else
		{
			request.getRequestDispatcher("/LogIn").forward(request, response);
		}
			
		}catch(Exception e){
			e.printStackTrace();
		}
		request.getRequestDispatcher("/WEB-INF/Index.jsp").forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			doGet(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

}
