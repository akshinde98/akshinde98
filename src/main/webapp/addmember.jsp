<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Member</title>
</head>
<body>
	<%@ include file="userHome.jsp" %>
	<%
		if ("POST".equalsIgnoreCase(request.getMethod())) {
			
			String uname=request.getParameter("username");
		    String pwd=request.getParameter("password");
		    String name=request.getParameter("uname");
		    String addr=request.getParameter("address");
		    String email=request.getParameter("email");
		   String mob=request.getParameter("mob");
		    String gender=request.getParameter("gender");
		    Date date = Date.valueOf(request.getParameter("dob"));
		    //java.sql.Date d1=new java.sql.Date
		    
		    try
		    {
		    	Class.forName("com.mysql.cj.jdbc.Driver");
		    	Connection con=DriverManager.getConnection("jdbc:mysql://localhost/ecop","root","akshay");
		    	PreparedStatement stmt=con.prepareStatement("select* from user where user_name=?");
		    	
		    	stmt.setString(1, uname);
		    	ResultSet rst=stmt.executeQuery();
		    	if(rst.next()){
		    		out.println("user name already exists, User not created");
		    		
		    	}
		    	else{
		    		PreparedStatement stmt1=con.prepareStatement("insert into user (user_name,password,user_type) values (?,?,1)");
		    		stmt1.setString(1, uname);
			    	stmt1.setString(2,pwd);
			    	
			    	stmt1.executeUpdate();
			    	rst=stmt.executeQuery();
			    	
			    	if(rst.next()){
			    		int uid=rst.getInt("user_id");
			    		PreparedStatement stmt2=con.prepareStatement("insert into userdetails values(?,?,?,?,?,?,?)");
			    		stmt2.setInt(1, uid);
						stmt2.setString(2, name);
						stmt2.setString(3, addr);
						stmt2.setString(4, email);
						stmt2.setString(5, mob);
						stmt2.setDate(6, date);
						stmt2.setString(7, gender);
						stmt2.executeUpdate();

			    	}
		    	}
		    }
		    	
		    	catch(Exception e)
		    	{
		    		out.println(e.toString());
		    	}
		    	
		}
		else
		{
	 %>
	 	<form action="addmember.jsp" method="post" name="form2">
	 	
	 	<label>User name</label>
	 	<input type="text" name="username"/><br><br>
	 	
	 	<label>Password</label>
	 	<input type="text" name="password"/><br>
	 	<br> <label>Name :</label> <input type="text" name="uname"
			required /><br><br>
	 	
	 	<label>Address</label>
	 	<textarea rows="5" cols="20" name="address"></textarea><br><br>
	 	
	 	<label>Email</label>
	 	<input type="email" name="email"/><br><br>
	 	
	 	<label>Mobile No</label>
	 	<input type="text" name="mob"/><br><br>
	 	
	 	<label>Gender</label>
	 	<input type="radio" name="gender" value="Male">Male</input>
	 	<input type="radio" name="gender" value="female">Female</input>
	 	<input type="radio" name="gender" value="Other">Other</input>	<br> <br>	
	 	<label>DOB</label>
	 	<input type="date" name="dob"/><br><br>
		<input type="submit" value="Add">
		<input type="reset" value="Cancel">
	 	</form>
	 	<%
		}
	 %>
	</body>
</html>