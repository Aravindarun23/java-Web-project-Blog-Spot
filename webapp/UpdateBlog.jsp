<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link rel="stylesheet" href="All.css">
<meta charset="ISO-8859-1">
<title>UpdateBlog</title>
</head>
<body>
<h1 id="h1">Enter Your Details</h1>
<br>
<div class="updateform">
<form action="UpdateContent.jsp" method="post">
<div>
<label>USERID</label>
<input type="text"
name="UserId" placeholder="Enter the user id" autocomplete="off" id="UserId">
</div>
<br>
<div>
<label>PASSWORD</label>
<input type="password" name="UserPass" autocomplete="off" placeholder="Enter Your Password" id="UserPass">
</div>
<br>
<div id="upsum">
<input type="SUBMIT" class="btb btn-primary"  name="Submit" id="Submit" value="Submit">
</div>
<div id="a">
<a href="Index.jsp" role="button" class="btn btn-lng btn-danger">Back</a>
</div>
</form>
</div>

</body>
</html>