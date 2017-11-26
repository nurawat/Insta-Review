<%-- 
    Document   : signup_checker
    Created on : Oct 30, 2016, 2:21:50 AM
    Author     : Arun Rawat
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SignUp Page Checker Page</title>
    </head>
    <body><h1>
        <%   
            int i=123;
            String fname=request.getParameter("fname");
            String lname=request.getParameter("lname");
            String email=request.getParameter("email");
            String uname=request.getParameter("uname");
            String pass=request.getParameter("pass");
            
                     
        %>
        
        
        
<%  
    try
    {
         Class.forName("oracle.jdbc.driver.OracleDriver");
         Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "system", "123");
         Statement stmt = conn.createStatement();
         
         String query="select * from insta_users where email_id='"+email+"' or username='"+uname+"'";
         
         i=stmt.executeUpdate(query);
 
         if (i > 0) 
         {
                 
            
            //session.setAttribute("userid", user);
            response.sendRedirect("../signup.jsp?att=1");
           // out.print("Registration Successfull!"+"<a href='index.jsp'>Go to Login</a>");
         }
         else 
         {
             String iquery="insert into insta_users "
                    + "values ('"+fname+"','"+lname+"','"+uname+"','"+   email+"','"+pass+"')";
           stmt.executeUpdate(iquery);
           //out.println(iquery);
           response.sendRedirect("../login.jsp");
         }
       
             
         
    }
    catch(Exception e)
    {
        out.println(e.getMessage());
    }
%>
        
        

     
    </body>
</html>

