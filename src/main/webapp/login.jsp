<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<style>
 body {
 	align:ceter;
    color: #222;
    font-size: 100%;
    line-height: 24x;
    margin: 0;
	padding:0;
	background:url("E:\Advanced Java\test.jpg");
	font-family: "Raleway",sans-serif;}
h1 {text-align: center;  
    color: #277582;  
    padding: 20px; }

#a{width: 120px;  
    height: 30px;  
    border: none;  
    border-radius: 17px;  
    padding-left: 7px;  
    color: blue;
     font-size: 100%;}
 #b{width: 120px;  
    height: 30px;  
    border: none;  
    border-radius: 17px;  
    padding-left: 7px;
     font-size: 100%;  
    color: blue;}
    
    label{color: black;  
    font-size: 17px;}

 .login{  
        width: 382px;  
        margin: auto;  
        margin: 20 0 0 450px;  
        padding: 10px;  
          
        border-radius: 15px ;}
 input[type=text], input[type=password] {
	  width: 100%;
	  padding: 10px;
	  margin: 5px 0 22px 0;
	  border: none;
	  background: #f1f1f1;}


</style>
<meta charset="ISO-8859-1">
<title>ECOP'S</title>
<script>
	function validateForm() {
		let x = document.forms["form1"]["username"].value;
		let y = document.forms["form1"]["password"].value;
		if (x == "" || y == "") {
			alert("UserName and Password must be filled out");
			return false;
		}
	}
</script>
</head>
<body > <h1>Welcome E-LibManager</h1>

<%
	if ("POST".equalsIgnoreCase(request.getMethod())) {
	    
	    String uname=request.getParameter("username");
	    String pwd=request.getParameter("password");
	    try
	    {
	    	Class.forName("com.mysql.cj.jdbc.Driver");
	    	Connection con=DriverManager.getConnection("jdbc:mysql://localhost/ecop","root","akshay");
	    	PreparedStatement stmt=con.prepareStatement("select* from user where user_name=? and password=? and status=1" );
	    	stmt.setString(1, uname);
	    	stmt.setString(2,pwd);
	    	ResultSet rs=stmt.executeQuery();
	    	if(rs.next())
	    	{
	    		session.setAttribute("um", uname);
	    		session.setAttribute("ut", rs.getInt("user_type"));
	    		
	    		response.sendRedirect("userHome.jsp");
	    		

	    			} else {
	    		out.println("Invalid Crententials. Try again");
	    			}

	    }
	    catch(Exception e)
	    {
	    	out.println(e.toString());
	    }
	} 
	else {
		%>
		<div class="login">
		<form action="login.jsp" method="post" name="form1">
		<label>User Name</label>
		<input type="text" name="username" id="c" required>
		<br><br>
		<label>Password</label>
		<input type="password" name="password" id="c" required>
		<br><br><br>&emsp;&emsp;
		<input type="submit" value="Login" id="a" >&emsp;&emsp;
		<input type="reset" value="Cancel" id="b">&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
		</form>
		</div>
	 <%
	}
%>

</body>
</html>







