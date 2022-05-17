<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<% 
int id=Integer.parseInt(request.getParameter("id"));
Class.forName("com.mysql.jdbc.Driver");
Connection con =DriverManager.getConnection("jdbc:mysql://localhost:3306/ZOHO","root","root");
PreparedStatement pstmt =con.prepareStatement("delete from BlogSpot where UserId=?");
pstmt.setInt(1,id);
pstmt.executeUpdate();
%>
<script type="text/javascript">
alert("Delete Sucessfully");</script>
<%response.sendRedirect("Index.jsp"); %>

</body>
</html>