<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

<link rel="stylesheet" href="All.css">
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<div class="datatable">
<div class="col-sm-5">
<div class="panel-body">
<table class="table table-striped" >
     <tr class="table-primary">
     <th >BloggerName</th>
     <th>ToppicName</th>
     <th>Explore</th>
     </tr>
     
<%
Class.forName("com.mysql.jdbc.Driver");
Connection con =DriverManager.getConnection("jdbc:mysql://localhost:3306/ZOHO","root","root");
Statement st= con.createStatement();		
ResultSet rs=st.executeQuery("select * from BlogSpot");
while(rs.next())
{
	int id=rs.getInt("UserId");
	%>
	<tr>
    <td><%=rs.getString("Name")%></td>
    <td><%=rs.getString("TopicName")%></td>
    <td><a href="Content.jsp?id=<%=id%>" >Open</a></td>
    </tr>
<% }
%>
</table>
</div>
</div>
</div>
<a id="viewback" href="Index.jsp" class="btn btn-lng btn-danger">Back</a>

</body>
</html>