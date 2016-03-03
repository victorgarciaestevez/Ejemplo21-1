<%@page import="javax.swing.text.AbstractDocument.Content"%>
<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <title>Ejercicio 5</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <style>
            
            body{
                text-align: left;
                background-color: lime;
            }
            td{
                
            }
            
        </style>
    </head>
    <body>
        
        <h1>Ejercicio 5 de DSW</h1>
        <br>
        <h3>Enfermedades</h3>
        
        <form action="./Success" method="GET">
            <select name="dolor" id="dolor">
                <option value="ca">Cabeza</option>
                <option value="mi">Migraña</option>
                <option value="lum">Lumbares</option>
                <option value="cer">Cervicales</option>
                <option value="re">Recorciolis</option>
            </select>
            <input type="submit" value="Enviar">
        </form>
    </body>
</html>
