<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="jsp.css">
<title> Inicio de Sesi�n</title>
</head>
<body>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.SQLException" %>
 <%@ page import="java.sql.ResultSet" %>

<%
   String url = "jdbc:mysql://localhost:3306/solociencia";
   String user = "root";
   String password = "";
   Class.forName("com.mysql.jdbc.Driver");
   Connection conn = DriverManager.getConnection(url, user, password);
%>

<%  
try {
	//capta los datos del formulario
String nombreUsuario = request.getParameter("name");
String contrasena = request.getParameter("password");

String consulta = "SELECT * FROM registrousuario WHERE nombre=?";
PreparedStatement declaracion = conn.prepareStatement(consulta);
declaracion.setString(1, nombreUsuario);
ResultSet resultado = declaracion.executeQuery();

if (resultado.next()) {
   String contrasenaDB = resultado.getString("clave");
   // Verificar si la contrase�a ingresada coincide con la almacenada en la base de datos
   if (contrasena.equals(contrasenaDB)) {
      // contrase�a es correcta, inicia sesion
      // usuario verificado
      session.setAttribute("name", nombreUsuario);
      // envia a la pagina de inicio
      response.sendRedirect("Home.html");
   } else {
      // Contrase�a incorrecta, mostrar mensaje de error
      out.println("La contrase�a ingresada no es valida. Intentalo nuevamente.");
      
   }
} else {
   // Usuario no encontrado, mostrar mensaje de error
   out.println("El usuario ingresado no existe. Intentalo nuevamente.");
}
	
}catch (Exception e) {
    out.print("Error en la conexion: " + e.getMessage());
}
%>

 <form>
  
   
 <div class="contenedor">
  <div class="registrosjsp">
    <p>Clic Aqu�</p>
    <a href="registros.html">Registrarse</a>
    <a href="Pagina-1.html">Iniciar Sesi�n</a>
  </div>
</div>
  </form>
</body>
</html>