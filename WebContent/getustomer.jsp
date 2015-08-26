<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
		String nm = request.getParameter("nm");
		String hint="";
		Class.forName("oracle.jdbc.OracleDriver");
		Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl","hr","hr");
		PreparedStatement pst = conn.prepareStatement(
				"select city from countrydetails where country like ?");
		
		pst.setString(1,nm + "%"); 
		ResultSet rs=  pst.executeQuery(); 
		response.getWriter().write("<table border=1>");
		
		 response.getWriter().write("<tr><th><b>city</b></th></tr>");
		while(rs.next()){
			//System.out.println(rs.getString(1));
			 response.getWriter().write("<tr><td><b>"+rs.getString(1)+"</b></td></tr>");
			 
		}
		
		response.getWriter().write("</table>");
		conn.close();
	%>
</body>
</html>