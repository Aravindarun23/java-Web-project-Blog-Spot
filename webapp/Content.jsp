<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import ="java.sql.*" %>
    <%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link rel="stylesheet" href="All.css">
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
Class.forName("com.mysql.jdbc.Driver");
Connection con =DriverManager.getConnection("jdbc:mysql://localhost:3306/ZOHO","root","root");
Statement st= con.createStatement();		
ResultSet rs=st.executeQuery("select * from BlogSpot");
while(rs.next()){
	String h=request.getParameter("id");
	if(rs.getInt("UserId")==Integer.parseInt(h)){
		%>
		<br>
		<h1 id="contentview"><%=rs.getString("TopicName")%></h1>
		<br>
		<p><%=rs.getString("Content")%></p>
	<%
	}
}
%>
<a href="ViewBlog.jsp" role="button"class="btn btn-lng btn-danger">Back</a>

</body>
</html>