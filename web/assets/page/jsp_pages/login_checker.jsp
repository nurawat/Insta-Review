<%-- 
    Document   : login_checker
    Created on : Oct 29, 2016, 11:09:57 PM
    Author     : Arun Rawat
--%>

<%@page import="instareview.constants"%>
<%@page import="javax.swing.JOptionPane"%>
<%@page contentType="text/html" pageEncoding="UTF-8" session="true"%>
<%@page import="java.sql.*" %>
<%@page import="instareview.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body><h1>
        <%   int i=123; 
              String pwd = request.getParameter("pass");
             String email = request.getParameter("email");
             String fname="";        
            
        %>
        
        
        
<%
     
  
    
    try
    {
         Class.forName("oracle.jdbc.driver.OracleDriver");
         Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "system", "123");
         Statement stmt = conn.createStatement();
         
         String query = "select * from insta_users where email_id='"+email+"' and password='"+pwd+"'";
        
         i=stmt.executeUpdate(query);
         ResultSet resultset = stmt.executeQuery(query); 
          
         
         while(resultset.next())
         {
            fname=resultset.getString(1); 
         }
         if (i > 0) 
         {
            //session.setAttribute("userid", user);
             constants.email=email;
             session.setAttribute("email", email); 
             session.setAttribute("name", fname);
             response.sendRedirect("../mainpage.jsp?email="+email);
           // out.print("Registration Successfull!"+"<a href='index.jsp'>Go to Login</a>");
          }
         else 
         {
            //JOptionPane.showMessageDialog(null, "Wrong Username/Password");
            response.sendRedirect("../login.jsp?att=1");
         }
             
         
    }
    catch(Exception e)
    {
        out.println(e.getMessage());
    }
%>
        
        

     
    </body>
</html>
