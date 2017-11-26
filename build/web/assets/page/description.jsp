<%-- 
    Document   : description
    Created on : Oct 30, 2016, 2:39:52 PM
    Author     : Arun Rawat
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
	<head>
    <%
   String id=request.getParameter("m_id");
   String email=(String)session.getAttribute("email");   
   %>
    	<title> Description | Insta - Review </title>
        <link rel="stylesheet" type="text/css" href="../CSS/description.css"/>
        <link rel="stylesheet" type="text/css" href="../CSS/Tile Page.css"/>
         <link type="text/css" rel="stylesheet" href="../CSS/cast.css"/>
         <link type="text/css" rel="stylesheet" href="../CSS/login.css"/>
         
         
         
    </head>
    
    <body>
  
    	  <div class="heading" style="width:50%;margin:0 auto;margin-top:2%	">	   				
           			 <div class="heading_name">
                		<h3 id="heading">Insta - Review Movie Description</h3>
            		</div>
	   	   </div> 
        
<%  
    try
    {
    Class.forName("oracle.jdbc.driver.OracleDriver");
    Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "system", "123");
    Statement stmt = conn.createStatement();
    String query = "select * from movie where m_id='"+id+"'";
    ResultSet resultset = stmt.executeQuery(query);
    while(resultset.next())
    {
            String name=resultset.getString("name");
            String year=resultset.getString("year");
            String pg=resultset.getString("pg");
            String time=resultset.getString("time");
            String genre=resultset.getString("genre");
            String date=resultset.getString("dat");
            String pic1=resultset.getString("pic1");
            String pic2=resultset.getString("pic2");
            String pic3=resultset.getString("pic3");
            String pic4=resultset.getString("pic4");
            String desc=resultset.getString("description");
            String dir=resultset.getString("director");
            String wirter=resultset.getString("writers");
            String stars=resultset.getString("stars");
            String storyline=resultset.getString("storyline");
            int rating=(int)Float.parseFloat(resultset.getString("rating"))/2;
            int nou=Integer.parseInt(resultset.getString("no_of_users"));
            String c1,c2,c3,c4,c5;
            
            c5=(rating==5) ? "checked":"";
            c4=(rating==4) ? "checked":"";
            c3=(rating==3) ? "checked":"";
            c2=(rating==2) ? "checked":"";
            c1=(rating==1) ? "checked":"";
    
%>             
        
       <div class="sidebar"  style="padding-top:2%">
		<div class="sidebar-widget">
			<h3 style="font-size:25px">User Rating</h3><hr>			
			 <table class="wrapper" align="center" cellpadding="0" cellspacing="0">
			 	<tr>
                                <h1 style="font-size:36px"><%out.println(resultset.getString("rating"));%></h1>
					<p>Rate What You Think :-</p>					
					  <span class="starRating">
                                            <input id="rating5" type="radio" name="<%out.println("rating"+id);%>" value="5"
                                                   <%out.println(c5);%>>
                                            <label for="rating5">5</label>
                                            <input id="rating4" type="radio" name="<%out.println("rating"+id);%>" value="4"
                                                   <%out.println(c4);%>>
                                            <label for="rating4">4</label>
                                            <input id="rating3" type="radio" name="<%out.println("rating"+id);%>" value="3"
                                                   <%out.println(c3);%>>
                                            <label for="rating3">3</label>
                                            <input id="rating2" type="radio" name="<%out.println("rating"+id);%>" value="2"
                                                   <%out.println(c2);%>>
                                            <label for="rating2">2</label>
                                            <input id="rating1" type="radio" name="<%out.println("rating"+id);%>" value="1"
                                                   <%out.println(c1);%>>
                                           <label for="rating1">1</label>
                                        </span>					
				</tr>
                <h1 style="font-size:18px">You Haven't Rated This Movie Yet !!!</h1>
			 </table>
		</div>
	</div>
       <div id="container">    
			<div class="title">
				<table cellspacing="0" cellpadding="0" border="0" >
				  <tbody>
					<tr>
					   <td rowspan="2" id="img_primary">
							<div class="image">
								<a href="#"> 
									<img height="300" width="250" src="<%out.println(pic1);%>"  />
								</a>                        
							</div>        						
						</td>					
						<td id="overview-top">    					
							<h1> 
								<span style="font-size:32"><%out.println(name);%></span>
							   <span style="font-size:20"><%out.println(year);%></span>
							</h1>						
							 <div class="infobar">
                                                             
								<%out.println(pg);%> | <%out.println(time);%> min | <%out.println(genre);%> | <%out.println(date);%>									
							 </div> 
							<hr/> <br/>
							 <div class="clear"></div>              
								<p class="Higlight">			
									<%out.println(desc);%>
								</p>  
                                 <br/>                              
								 <div>
									 <h4 class="inline">Director:</h4>
									 <span style="font-size:20"><%out.println(dir);%></span>
								</div>
							<div> 
							<h4 class="inline">Writers:</h4>
							<span style="font-size:20"<%out.println(wirter);%></span>, 
						                         
							<div>
							 <h4 class="inline">Stars:</h4>
						
							<span  style="font-size:20"><%out.println(stars);%></span>		                       		 
						 </div>      
                         <br>
                          
								
                         <br>                                
						</td>
					</tr>
				</tbody>
				</table>			   		
			</div>
		  <div>          
	    
     <div class = "title" style="margin-top:1%">     
		<h2 style="font-family:Verdana;font-stretch:extra-condensed;font-weight:500">StoryLine</h2>
        <p style="font-size:20px"><%out.println(storyline);%></p>	
	  </div>
 <%}
    conn.close();}
 catch(Exception e)
 {
     out.println(e.getMessage());
 }%>

	 <div class = "title" style="margin-top:1%">     
		<h2 style="font-family:Verdana;font-stretch:extra-condensed;font-weight:500">Comments</h2>                
                
                   
                <form name="myform" method="post" id="f" action="jsp_pages/desc.jsp?id=<%=id%>"  style="padding:10px">
                    
                    <table border="0" style="width: 100%">
                        
                        <tr>
                            <td >
                                <li style="margin-top:0px">

                                    <input type="text" class="text" placeholder="type your comment here" 
                                        name="comm" style="padding-left:2%" 
                                        onFocus="this.value = '';" onBlur="if (this.value == '') {this.value = '';}"
                                        id="com"/>
                                </li>
                                
                            </td>                         
                            
                            
                            <td>                              
                                      <input type="submit" class="" value="SignUp" 
                                             style="padding: 0px;padding:10px" onclick="desc()"
                                     />
                        
		    
                                  </form> 
                            </td>
                            
                        </tr>
 </table>
                    <div style="width: 100%">
      <%      
                                try
                                   {
                                   Class.forName("oracle.jdbc.driver.OracleDriver");
                                   Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "system", "123");
                                   Statement stmt = conn.createStatement();
                                   String query ="select * from comment_table where comm !='null' and  mid='"+id+"'";
 
                                   ResultSet resultset=stmt.executeQuery(query);
                                   while(resultset.next())
                                   {
                            %>
                            <p>
                                   <img src="../images/pp/arun.jpg" width="50" height="50"/>
                                   <%=resultset.getString("comm")%>
                            </p>
                          
                                 
                            <%
                                   }
                                   conn.close();
                                   }
                                catch(Exception e){out.println(e.getMessage());}
                               %>                        
                      
                    </div>
          
	  </div>   
    </body>
</html>