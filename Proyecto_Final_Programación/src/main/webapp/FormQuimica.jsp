<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*"  %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="jsp.css">
<title>Registro en el Curso de Qu�mica y Biolog�a</title>
</head>
<body>
 <form>
  
  
 <div class="contenedor">
  <div class="registrosjsp">
    <h1>�Registro exitoso!</h1>
    <p>Los datos fueron insertados correctamente.</p>
    <a href="Home.html">P�gina de Inicio</a>
  </div>
</div>
  </form>
   <%
   //capta los datos del formulario 
   String nombreQ = request.getParameter("nombreQ");
   String cedulaQ = request.getParameter("cedulaQ");
   String fechainicioQ = request.getParameter("fechainicioQ");
    
   
        //Inserta los datos en la tabla registroquimica
        Class.forName("com.mysql.jdbc.Driver");
        Connection dbconect = DriverManager.getConnection("jdbc:mysql://localhost:3306/solociencia","root","");
        Statement dbstatement = dbconect.createStatement();
        String insertarsql = "INSERT INTO registroquimica (nombreQ,cedulaQ,fechainicioQ) VALUES ('"+nombreQ+"','"+cedulaQ+"','"+fechainicioQ+"')";
        dbstatement.executeUpdate(insertarsql);
        
         %>
</body>
</html>
