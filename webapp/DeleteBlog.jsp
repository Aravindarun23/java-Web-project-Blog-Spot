<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
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
<div class="updateform">
<form action="#" method="post">
<div>

<label>USERID</label>
<input type="text"name="UserId" placeholder="Enter the user id" id="UserId">
</div>
<br>
<div>
<label>PASSWORD</label>
<input type="password" name="UserPass" placeholder="Max 8 char" id="UserPass">
</div>
<br>
<div id="upsum">
<input type="SUBMIT" class="btb btn-primary" name="Submit" id="Submit" value="Submit">
</div>
<div id="a">
<a href="Index.jsp" role="button" class="btn btn-lng btn-danger">Back</a>
</div>
</form>
</div>

<%
Class.forName("com.mysql.jdbc.Driver");
Connection con =DriverManager.getConnection("jdbc:mysql://localhost:3306/ZOHO","root","root");
if(request.getParameter("Submit")!=null)
{
	try{
		String UserPass=request.getParameter("UserPass");
		int UserId=Integer.parseInt(request.getParameter("UserId"));
		if(UserPass!=null && UserId!=0){
			Statement st= con.createStatement();		
			ResultSet rs=st.executeQuery("select * from BlogSpot");
			boolean flag=false;
			while(rs.next()){
				int id=rs.getInt("UserId");
				if(rs.getString("UserPass").equals(UserPass) && rs.getInt("UserId")==(UserId)){
					
					%>
					<h2 id ="h2">Are You Want To Delete : <a role="button" class="btn btn-lng btn-danger" href="Delete.jsp?id=<%=id%>">Yes</a>	<a href="Index.jsp" role="button" class="btn btn-lng btn-success">No</a></h2>
				<%
				flag=true;
				}
			}
			if(flag==false){
				%>
				<p style="color:red" id="h2" >Incorrect Data Please Check</p>
			<% 	
			}
		}	
	}catch(Exception e){
		%>
		<p style="color:red" id="h2">Please Enter A Valid Inputs </p>
		<%
	}	
}%>
</body>
</html>