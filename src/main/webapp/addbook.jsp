<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Book</title>
</head>
<body>
	<%@ include file="userHome.jsp" %>
<%
		if ("POST".equalsIgnoreCase(request.getMethod())) {
			
			String title=request.getParameter("title");
		    String author=request.getParameter("author");
		    String pbc=request.getParameter("publication");
		    String edt=request.getParameter("edition");
		    int price=Integer.parseInt(request.getParameter("price"));
		    
		    try
		    {
		    	Class.forName("com.mysql.cj.jdbc.Driver");
		    	Connection con=DriverManager.getConnection("jdbc:mysql://localhost/ecop","root","akshay");
		    	PreparedStatement stmt=con.prepareStatement("insert into books (author,title,Edition,Price,Publication) values (?,?,?,?,?)");		
		    	stmt.setString(1,author);
				stmt.setString(2,title);
				stmt.setString(3,edt);
				stmt.setInt(4,price);
				stmt.setString(5,pbc);
				
				stmt.executeUpdate();
				out.println("Book Inserted Sucessfully.......");
				
			}
			catch(Exception e)
			{
				out.println(e.toString());
			}
				
		}
		else
		{
		%>
		<form action="addbook.jsp" method="Post">
		<label>Title :<input type="text" name="title" required></label><br><br>
		<label> Author :<input type="text" name="author" required ></label><br><br>
		<label> Publication:<input type="text" name="publication" required></label><br><br>
		<label>Edition :<input type="text" name="edition" required></label><br><br>
		<label>Price :<input type="text" name="price"required></label><br><br>
		<input type="submit" value="Add">
		<input type="button" value="cancel">

		</form>
		<%
		}
		%>
		</body>
		</html>