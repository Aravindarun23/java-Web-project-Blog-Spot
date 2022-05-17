<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link rel="stylesheet" href="All.css">
<meta charset="ISO-8859-1">
<title>UpdateContent</title>
</head>
<body>
<%
Class.forName("com.mysql.jdbc.Driver");
Connection con =DriverManager.getConnection("jdbc:mysql://localhost:3306/ZOHO","root","root");

String TopicName=null;
int UserI=0;
String Name=null;
String UserP=null;
String Content=null;
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
				if(rs.getString("UserPass").equals(UserPass) && rs.getInt("UserId")==(UserId)){
					TopicName=rs.getString("TopicName");
					UserI=rs.getInt("UserId");
					UserP=rs.getString("UserPass");
					Name=rs.getString("Name");
					Content=rs.getString("Content");
					flag=true;
					break;
						
				}	
			}
			if(flag==true){
				%>
			<h2 id="h1">Update Your Details</h2>
			<% 
				
			}
			else{
				response.sendRedirect("UpdateBlog.jsp");
			
			}
			
			%>
<%
	}	
	}catch(Exception e){
		out.println("Please Enter a valid inputs");	
		response.sendRedirect("UpdateBlog.jsp");
	}	
}
%>

<br>

<div class="userform">
<form action="update.jsp" method="post">
<div>
<label>NAME</label>
<input type="text" name="Name" placeholder="Enter the name"  value="<%=Name%>" id="Name">
</div>
<div>
<input type="text" name="UserId" placeholder="Enter the user id" style="display: none;" value="<%=UserI %>" id="UserId">
</div>
<div>
<label> PASSWORD</label>
<input type="password" name="UserPass"  placeholder="Max 8 char"  value="<%=UserP %>" id="UserPass">
</div>
<div>
<label>TITLE</label>
<input type="text" name="TopicName" placeholder="Blog Title"  value="<%=TopicName %>" id="TopicName">
</div>
<div>
<label>CONTENT</label>
<input type="text" name="Content" placeholder="Enter content"  value="<%=Content%>" id="Content">
</div>
<input type="SUBMIT" class="btb btn-primary" name="Submit" id="Submit" value="Submit">
</form>
</div>
<a id="backup" href="UpdateBlog.jsp" role="button"class="btn btn-lng btn-danger">Back</a>

</body>
</html>