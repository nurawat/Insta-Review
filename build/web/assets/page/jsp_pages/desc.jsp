<%-- 
    Document   : desc
    Created on : Nov 7, 2016, 12:47:43 PM
    Author     : Arun Rawat
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="instareview.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>
        <%      
 try
    {
    Class.forName("oracle.jdbc.driver.OracleDriver");
    Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "system", "123");
    Statement stmt = conn.createStatement();
    String query = "insert into comment_table values('"+constants.email+"','"+request.getParameter("id")+"','"
            +request.getParameter("comm")+"')";
    
   int i=stmt.executeUpdate(query);   
    if(i!=0)
    {
       response.sendRedirect("../description.jsp?m_id="+request.getParameter("id"));
    }
    conn.close();
    }
 catch(Exception e){out.println(e.getMessage());}
%>    
</h1>
    </body>
</html>
