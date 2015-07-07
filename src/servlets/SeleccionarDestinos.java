package servlets;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Destino;
import repository.DestinoRepository;
import sun.security.krb5.internal.crypto.Des;

public class SeleccionarDestinos extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SeleccionarDestinos() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			DestinoRepository destinoRepository = new DestinoRepository();
			ArrayList<Destino> destinos = new ArrayList<Destino>();
			
			Destino destino = new Destino();
			
			destino.setId(0);
			destino.setNombre("SELECCIONE UN VUELO");
			destino.setDescripcion("Vuelo inicial");
			
			destinos.add(destino);
			destinos.addAll(destinoRepository.ListadoBase());
			
			
			request.setAttribute("destinos", destinos);
			request.getRequestDispatcher("/WEB-INF/SeleccionarDestinos.jsp").forward(request, response);
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
