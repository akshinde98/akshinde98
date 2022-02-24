<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
		String uName= session.getAttribute("um").toString();
		String psd=session.getAttribute("ut").toString();
		
		int ut=Integer.parseInt(psd);
		
		try{
			Class.forName("com.mysql.cj.jdbc.Driver");
	    	Connection con=DriverManager.getConnection("jdbc:mysql://localhost/ecop","root","akshay");
	    	
	    	PreparedStatement stmt=con.prepareStatement("select* from usermenu where userRole="+ut);
	    	
	    	ResultSet rst=stmt.executeQuery();
	    	
	    	while(rst.next())
		    	{
		    		out.println("<a href="+rst.getString("url")+">"+rst.getString("MenuItem")+"</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
		    	}
			}
		catch(Exception e){
			out.println(e.toString());			
		}
%>
</body>
</html>