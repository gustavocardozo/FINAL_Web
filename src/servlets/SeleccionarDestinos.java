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
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			if (request.getSession().getAttribute("usuario") != null) {
				DestinoRepository destinoRepository = new DestinoRepository();
				ArrayList<Destino> destinos = new ArrayList<Destino>();

				Destino destino = new Destino();

				destino.setId(0);
				destino.setNombre("SELECCIONE UN VUELO");
				destino.setDescripcion("Vuelo inicial");

				destinos.add(destino);
				destinos.addAll(destinoRepository.ListadoBase());

				request.getSession().setAttribute("destinos", destinos);
				request.setAttribute("destinos", destinos);
				request.getRequestDispatcher("/WEB-INF/SeleccionarDestinos.jsp").forward(request, response);
			} else {
				request.getRequestDispatcher("/LogIn").forward(request, response);
			}

		} catch (Exception e) {
			e.printStackTrace();
			try {
				LimpiarSession.deleteSession(request);
				request.getRequestDispatcher("/WEB-INF/Error.jsp").forward(request, response);
			} catch (ServletException | IOException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			if (request.getSession().getAttribute("usuario") != null) {
				ArrayList<String> errores = new ArrayList<String>();
				String origen = request.getParameter("origen");
				String destino = request.getParameter("destino");

				if (origen != null && destino != null) {
					if (origen.equals(destino)) {
						errores.add("El destino y origen deben ser diferentes.");
						request.setAttribute("destinos", request.getSession().getAttribute("destinos"));
						request.setAttribute("errores", errores);
						request.getRequestDispatcher("/WEB-INF/SeleccionarDestinos.jsp").forward(request, response);
					} else if (origen.equals("0") || destino.equals("0")) {
						errores.add("Debe seleccionar un origen y/o destino correcto.");
						request.setAttribute("destinos", request.getSession().getAttribute("destinos"));
						request.setAttribute("errores", errores);
						request.getRequestDispatcher("/WEB-INF/SeleccionarDestinos.jsp").forward(request, response);
					} else {
						request.getSession().setAttribute("doGet", true);
						request.getRequestDispatcher("/SeleccionarPaquete").forward(request, response);
					}
				} else {
					System.out.println("Origen y destino nulo...");
				}
			} else {
				request.getRequestDispatcher("/LogIn").forward(request, response);
			}

		} catch (Exception e) {
			e.printStackTrace();
			try {
				LimpiarSession.deleteSession(request);
				request.getRequestDispatcher("/WEB-INF/Error.jsp").forward(request, response);
			} catch (ServletException | IOException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		}
	}

}
