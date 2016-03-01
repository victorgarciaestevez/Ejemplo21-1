<%@page import="javax.swing.text.AbstractDocument.Content"%>
<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <title>Ejercicio3</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <style>
            tbody{
                background-color: #D8D761;
                
            }
            td{
                width: 150px;
                text-align: center;
                margin: 0px;
            }
            label{
                display: inline-block;
                float: left;
                clear: left;
                width: 310px;
                text-align: right;
            }
            input {
                display: inline-block;
                float: left;
                
            }
        </style>
    </head>
    <body>
        <h3 style="color: red;">Introducir un n�mero para crear la tabla de multiplicar y cuantas operaciones deseas mostrar.</h3>
        <%
            boolean createTable = false;
            if(request.getParameter("num") != null && request.getParameter("rep") != null){
                createTable = true;
            }
        %>
        <form action="index.jsp" method="GET">
            <label for="num">Introduce un n�mero</label>
            <input type="number" required id="num" name="num"><br>
            
            <label for="num">Establece un l�mite de la tabla</label>
            <input type="number" required id="rep" name="rep"><br>
            <br>
            <br>
            <input type="submit" value="Crear tabla">
        </form>
        <div>
            <%
                String Contenido = "";
                if(createTable){
                    int num = Integer.parseInt(request.getParameter("num"));
                    int rep = Integer.parseInt(request.getParameter("rep"));
                    Contenido = "<br><table border='1'>";
                    for(int i = 1; i < (rep + 1); i++){
                        Contenido += "<tr><td>" + (num) + " * " + i + "</td>";
                        Contenido += "<td>" + (num) * i + "</td></tr>";
                    }
                    Contenido += "</table>";
                }
            %>
            
            <%= Contenido %>
        </div>
    </body>
</html>
