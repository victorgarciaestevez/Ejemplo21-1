<%@page import="javax.swing.text.AbstractDocument.Content"%>
<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <title>TODO supply a title</title>
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
        </style>
    </head>
    <body>
        <h1>Formulario</h1>
        <%
            boolean createTable = false;
            if(request.getParameter("num") != null && request.getParameter("rep") != null){
                createTable = true;
            }
        %>
        
        <form action="./Success" method="GET">
            <fieldset>
            <label for="num">Nombre: </label>
            <input type="text" required pattern=".{6,}" id="num" name="num"><br>
            </fieldset>
            
            <fieldset>
            <label for="num">Apellidos: </label>
            <input type="text" required pattern=".{10,}" id="rep" name="rep"><br>
            </fieldset>
            
            <fieldset>
            <label for="num">Correo: </label>
            <input type="text" required pattern=".{10,}" id="rep" minlenghtname="email"><br>
            </fieldset>
            
            <input type="submit" value="Calcular">
        </form>
        <div>
            <%
                String Contenido = "";
                if(createTable){
                    int num = Integer.parseInt(request.getParameter("num"));
                    int rep = Integer.parseInt(request.getParameter("rep"));
                    Contenido = "<table>";
                    for(int i = 0; i<rep; i++){
                        Contenido += "<tr><td>" + (num) + "*" + i + "</td>";
                        Contenido += "<td>" + (num)*i + "</td></tr>";
                    }
                    Contenido += "</table>";
                }
            %>
            
            <%= Contenido %>
        </div>
    </body>
</html>
