package tienda;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Iterator;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Fabio
 */
public class Tienda extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        ArrayList<Libro> libros = new ArrayList();

        if (request.getParameter("cod") != null) {

            String cod = request.getParameter("cod");
            ArrayList<String> productos = new ArrayList();
            String jspPath = getServletContext().getRealPath("/actividades/act6/files");
            String txtFilePath = jspPath + "/products.txt";
            BufferedReader reader = new BufferedReader(new FileReader(txtFilePath));
            String line;

            while ((line = reader.readLine()) != null) {
                String partes = line;
                productos.add(partes);
            }

            Libro libro = new Libro();
            Iterator<String> it = productos.iterator();

            while (it.hasNext()) {
                String element = it.next();
                String[] partes = element.split(";");

                for (int i = 0; i < partes.length; i++) {
                    if (partes[i].equals(cod)) {
                        libro.setCodigo(cod);
                        libro.setTitulo(partes[1]);
                        libro.setPrecio(Double.parseDouble(partes[2]));
                        libro.setCantidad(1);
                    }
                }
            }

            HttpSession session = request.getSession();

            if (session.getAttribute("libros") != null) {
                libros = (ArrayList<Libro>) session.getAttribute("libros");
            }

            Iterator<Libro> it2 = libros.iterator();
            boolean encontrado = false;

            while (it2.hasNext()) {
                Libro element = it2.next();

                if (element.getCodigo().equals(cod)) {
                    element.setCantidad(element.getCantidad() + 1);
                    encontrado = true;
                }
            }

            if (!encontrado) {
                libros.add(libro);
            }
            session.setAttribute("libros", libros);

            /*try (PrintWriter out = response.getWriter()) {
                Iterator<Libro> it3 = libros.iterator();
                while (it3.hasNext()) {
                    Libro element = it3.next();
                    out.print(element.getCodigo());
                    out.println(element.getCantidad());
                }
            }*/
            //String route = getServletContext().getRealPath("/actividades/act6/index.jsp");
           // response.sendRedirect(route);
            
            response.sendRedirect("/Tienda/actividades/act6/index.jsp");
        } else if (request.getParameter("comprar") != null) {

            response.sendRedirect("/Tienda/actividades/act6/compra.jsp");
        } else if (request.getParameter("cantidad") != null) {

            int cantidad = Integer.parseInt(request.getParameter("cantidad"));
            String cod = request.getParameter("cod2");
            HttpSession session = request.getSession();
            ArrayList<Libro> nuevos = new ArrayList();

            if (session.getAttribute("libros") != null) {
                libros = (ArrayList<Libro>) session.getAttribute("libros");

                Iterator<Libro> it2 = libros.iterator();

                while (it2.hasNext()) {
                    Libro element = it2.next();

                    if (element.getCodigo().equals(cod)) {
                        element.setCantidad(cantidad);
                    }
                    nuevos.add(element);
                }
                session.setAttribute("libros", nuevos);
            }

           // String route = getServletContext().getRealPath("/actividades/act6/compra.jsp");
           // response.sendRedirect(route);
            
            response.sendRedirect("/Tienda/actividades/act6/compra.jsp");
        } else if (request.getParameter("eliminar") != null) {

            String cod = request.getParameter("cod3");
            HttpSession session = request.getSession();
            ArrayList<Libro> nuevos = new ArrayList();

            if (session.getAttribute("libros") != null) {
                libros = (ArrayList<Libro>) session.getAttribute("libros");

                Iterator<Libro> it2 = libros.iterator();

                while (it2.hasNext()) {
                    Libro element = it2.next();

                    if (!element.getCodigo().equals(cod)) {
                        nuevos.add(element);

                    }
                }
                session.setAttribute("libros", nuevos);
            }
            response.sendRedirect("/Tienda/actividades/act6/compra.jsp");
        }

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
