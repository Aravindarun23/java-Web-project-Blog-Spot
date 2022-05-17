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
Class.forName("com.mysql.jdbc.Driver");
Connection con =DriverManager.getConnection("jdbc:mysql://localhost:3306/ZOHO","root","root");
if(request.getParameter("Submit")!=null)
{
	try{
		String name=request.getParameter("Name");
		String userId=request.getParameter("UserId");
		String userPass=request.getParameter("UserPass");
		String topicName=request.getParameter("TopicName");
		String content=request.getParameter("Content");
		boolean flag=false;
		if(name!="" && userId!="" && userPass!="" && topicName!="" && content!=""){
			PreparedStatement pstmt =con.prepareStatement("update BlogSpot set Name=? ,UserId=?,UserPass=?,TopicName=?,Content=? where UserId=?");
			pstmt.setString(1,name);
			pstmt.setInt(2,Integer.parseInt(userId));
			pstmt.setString(3,userPass);
			pstmt.setString(4,topicName);
			pstmt.setString(5,content);
			pstmt.setString(6,userId);
			pstmt.executeUpdate();
			%>
			<div>
			<script>
			alert("Update succesfully");
			</script>
			</div>
			<% 
			response.sendRedirect("Index.jsp");
			flag=true;
			
			
		}	
		if(flag==false){
			%>
			<script>
			alert("Please Enter Valid Details");</script>
			<% 
			response.sendRedirect("UpdateBlog.jsp");
			
			
			
		}
	}catch(Exception e){
		response.sendRedirect("UpdateContent.jsp");
	}	
}

%>

</body>
</html>