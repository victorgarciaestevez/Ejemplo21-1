
<%@page import="java.io.FileWriter"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.io.IOException"%>
<%@page import="java.io.FileNotFoundException"%>
<%@page import="java.io.FileReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>INDEX</title>
    </head>
    <body>

        <%
            ArrayList<String> productos = leerProductos();
            Iterator<String> it = productos.iterator();

            String cadena = "<table border='1px'>";
            cadena += "<th>Código</th><th>Descripción</th><th>Precio</th><th>Portada</th><th></th>";

            while (it.hasNext()) {
                String element = it.next();
                cadena += "<tr>";

                String[] partes = element.split(";");
                for (int i = 0; i < partes.length; i++) {
                    cadena += "<td>";
                    cadena += partes[i];
                    cadena += "</td>";
                } 
                
                // png
                cadena += "<td>";          
                cadena += "<img src='actividades/act6/files/imagen/" + partes[0] + ".png' />";
                cadena += "</td>";
                // end png
                
                cadena += "<td>";
                cadena += "<form action='/Tienda/Tienda' method='post'>";
                cadena += "<input type='text' value='" + partes[0] + "' name='cod' hidden/>";
                cadena += "<input type='submit' value='Facturar'/>";
                cadena += "</form>";
                cadena += "</td>";
                cadena += "</tr>";
            }
            cadena += "</table>";
            out.print(cadena);
        %>

        <form action='/Tienda/Tienda' method='post'>
            <input type='submit' value='Acceder al carro' name='comprar'/>
        </form>

        <%!
            public ArrayList<String> leerProductos() throws IOException, FileNotFoundException {

                ArrayList<String> productos = new ArrayList();

                String jspPath = getServletContext().getRealPath("/actividades/act6/files");
                String txtFilePath = jspPath + "/products.txt";
                BufferedReader reader = new BufferedReader(new FileReader(txtFilePath));
                String line;

                while ((line = reader.readLine()) != null) {
                    String partes = line;
                    productos.add(partes);
                }
                return productos;
            }
        %>
    </body>
</html>
