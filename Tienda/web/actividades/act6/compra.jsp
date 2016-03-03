<%@page import="java.io.IOException"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="tienda.Libro"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Carrito de la compra</title>
    </head>
    <body>
        <h1>Carro de la compra</h1>

        <%
            if (session.getAttribute("libros") == null) {
                out.print("No hay elementos en el carro.<br/>");
            } else {
                ArrayList<Libro> productos = (ArrayList<Libro>) session.getAttribute("libros");
                Iterator<Libro> it = productos.iterator();

                String cadena = "<table border='1px'>";
                cadena += "<th>Cantidad</th><th>Código</th><th>Descripción</th><th>Precio</th><th>Total</th><th></th>";

                while (it.hasNext()) {
                    Libro element = it.next();
                    cadena += "<tr>";
                    cadena += "<td>";
                    cadena += "<form action='/Tienda/Tienda' method='post'>";
                    cadena += "<input type='text' value='" + element.getCodigo() + "' name='cod2' hidden/>";
                    cadena += "<input type='text' value='" + element.getCantidad() + "' name='cantidad' size='3' />";
                    cadena += "<input type='submit' value='Actualizar'/>";
                    cadena += "</form>";
                    cadena += "</td>";
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
                    cadena += element.getCantidad() * element.getPrecio();
                    cadena += "</td>";
                    cadena += "<td>";
                    cadena += "<form action='/Tienda/Tienda' method='post'>";
                    cadena += "<input type='text' value='" + element.getCodigo() + "' name='cod3' hidden/>";
                    cadena += "<input type='submit' value='eliminar' name='eliminar'/>";
                    cadena += "</form>";
                    cadena += "</td>";
                    cadena += "</tr>";
                }
                cadena += "</table>";
                out.print(cadena);
            }
        %>

        <a href="index.jsp">Volver a la lista de libros</a><br/>
        <a href="factura.jsp">Ir a la factura</a>
    </body>
</html>
