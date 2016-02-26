import java.io.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class RequestInfo extends HttpServlet {

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response)
    throws IOException, ServletException
    {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        
        out.println("<!DOCTYPE html>");
        out.println("<html>");
        out.println("<head>");
        out.println("<title>Información del navegador</title>");            
        out.println("</head>");
        out.println("<body>");
        out.println("<center><h3 style='color: red;'>Información</h3></center>");
        out.println("<table border='1' bgcolor=\"#D8D761\">");
        
        Enumeration e = request.getHeaderNames();
        while (e.hasMoreElements()) {
            String name = (String)e.nextElement();
            String value = request.getHeader(name);
            out.println("<tr><td><strong>" +name + "</strong></td><td>" + value + "</td></tr>");
            
        }
        out.println("</table>");
        out.println("</body>");
        out.println("</html>");    
    }
}