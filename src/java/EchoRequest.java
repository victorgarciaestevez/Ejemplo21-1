import javax.servlet.*; import java.util.*; import java.io.*; 
public class EchoRequest extends GenericServlet 
{ 

    /**
     *
     * @return
     */
    @Override
   public String getServletInfo()
   { return "Echo Request Servlet";}
   @Override 
   public void service(ServletRequest peticion, ServletResponse respuesta) throws ServletException, IOException { 
respuesta.setContentType("text/plain"); 
PrintStream outputStream = new PrintStream(respuesta.getOutputStream()); 
outputStream.print("Servidor: " + peticion.getServerName() + ":"); 
outputStream.println (peticion.getServerPort()); 
outputStream.print("Cliente: " + peticion.getRemoteHost() + " "); 
outputStream.println(peticion.getRemoteAddr()); 
outputStream.println("Protocolo: " + peticion.getProtocol()); 
Enumeration params = peticion.getParameterNames(); 
 if (params !=null){
while (params.hasMoreElements()) { 
String parametro = (String) params.nextElement(); 
String valor = peticion.getParameter(parametro); 
outputStream.println(parametro + " = " + valor); 
     }
   }
  }
}
