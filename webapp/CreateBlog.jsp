<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
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
<h1 id="h1">Enter Your Details</h1>
<br>
<div class="userform">
<form action="#" method="get" class="form-group">
<div class="form-group">
<label>NAME</label>
<input type="text" name="Name" placeholder="Enter the name"   autocomplete="off" id="Name">
<h1></h1>
</div>
<div class="form-group">
<label>USERID</label>
<input type="text"
name="UserId" placeholder="Enter the user id"  autocomplete="off" id="UserId">
</div>
<div class="form-group">
<label>PASSWORD</label>
<input type="password" name="UserPass" placeholder="Max 8 char" id="UserPass">
</div>
<div class="form-group">
<label>TITLE</label>
<input type="text" name="TopicName"  autocomplete="off" placeholder="Blog Title" id="TopicName">
</div>
<br>
<div class="form-group">
<label id="con" >CONTENT</label>
<br>
<input type="text"  name="Content"  autocomplete="off" placeholder="Write Your Content" id="Content">
</div>
<input type="SUBMIT" class="btb btn-primary" name="Submit" id="Submit"
value="Submit">
</form>
</div>
<%
if(request.getParameter("Submit")!=null)
{
	try{
		String Name=request.getParameter("Name");
		String UserId=request.getParameter("UserId");
		String UserPass=request.getParameter("UserPass");
		String TopicName=request.getParameter("TopicName");
		String Content=request.getParameter("Content");
		if(Name!=null && UserId!=null && UserPass!=null && TopicName!=null && Content!=null){
			Class.forName("com.mysql.jdbc.Driver");
			Connection con =DriverManager.getConnection("jdbc:mysql://localhost:3306/ZOHO","root","root");
			PreparedStatement pstmt =con.prepareStatement("insert into BlogSpot (Name,UserId,UserPass,TopicName,Content) values(?,?,?,?,?)");
			pstmt.setString(1,Name);
			pstmt.setInt(2,Integer.parseInt(UserId));
			pstmt.setString(3,UserPass);
			pstmt.setString(4,TopicName);
			pstmt.setString(5,Content);
			pstmt.executeUpdate();
			%><p id="alertsuccess"><% out.println("Added Successfully");%></p>
			<script>
			alert("Record added succesfully");</script>
			<a id="home" role="button" href="Index.jsp"> HomePage</a>
			<% 
			
		}	
	}catch(Exception e){
		%><p id="alert"><% out.println("Please Enter a valid inputs");	%></p>
	<% 
	}	
}
%>
</body>
</html>