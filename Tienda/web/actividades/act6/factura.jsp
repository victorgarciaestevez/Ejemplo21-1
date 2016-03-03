<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="tienda.Libro"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Factura</h1>

        <%
            if (session.getAttribute("libros") != null) {

                double acumulado = 0;
                ArrayList<Libro> productos = (ArrayList<Libro>) session.getAttribute("libros");
                Iterator<Libro> it = productos.iterator();

                String cadena = "<table border='1px'>";
                cadena += "<th>CODIGO</th><th>TITULO</th><th>PRECIO</th><th>CANTIDAD</th><th>TOTAL</th>";

                while (it.hasNext()) {
                    Libro element = it.next();
                    cadena += "<tr>";
                    cadena += "<td>";
                    cadena += element.getCodigo();
                    cadena += "</td>";
                    cadena += "<td>";
                    cadena += element.getTitulo();
                    cadena += "</td>";
                    cadena += "<td>";
                    cadena += element.getPrecio();
                    cadena += "</td>";
                    cadena += "<td>";
                    cadena += element.getCantidad();
                    cadena += "</td>";
                    cadena += "<td>";
                    cadena += element.getCantidad() * element.getPrecio();
                    cadena += "</td>";
                    cadena += "</tr>";

                    acumulado += element.getCantidad() * element.getPrecio();
                }
                cadena += "<tr>";
                cadena += "<td></td><td></td><td></td><td></td><td>" + acumulado + "</td>";
                cadena += "</tr>";
                                cadena += "</table>";

                out.print(cadena);
            }
        %>


        <a href="index.jsp">Volver a la lista de libros</a><br/>
        <a href="compra.jsp">Seguir comprando</a><br/>
    </body>

</html>
