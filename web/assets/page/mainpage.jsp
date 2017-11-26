<%-- 
    Document   : mainpage
    Created on : Oct 30, 2016, 3:27:40 AM
    Author     : Arun Rawat
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" session="true"%>
<%@page import="java.sql.*" %>
<%@page import="java.util.*" %>
<%@page import="instareview.*" %>
<!DOCTYPE html>




<html>
	<head>
    	<link rel="stylesheet" type="text/css" href="../CSS/mainpage.css"/>
        <link rel="stylesheet" type="text/css" href="../CSS/sidepanel.css"/>
        <link rel="stylesheet" type="text/css" href="../CSS/index.css"/>
        <link rel="stylesheet" type="text/css" href="../CSS/mainbody.css"/>
        <link rel="stylesheet" type="text/css" href="../CSS/Tile_Page.css"/>
        <link rel="stylesheet" type="text/css" href="../CSS/description.css"/>
        
        <script>	
                      
			function clicked(x)
			{	if(x==1)
				{
				document.getElementById("panel").style.right = "100px";						
				}
				else
				{
				document.getElementById("panel").style.right = "-320px";			
				}
			}
                        function midpasser(x)
                        {
                           
                            window.location="description.jsp?m_id="+x;
                        }

	</script>
    </head>
    
    
    <body>
 
        <div id="panel" onMouseOver="clicked(1)" onmouseout="clicked(2)">    				
		  <div class="user-info">
                      <h4 class="h4" style="color:#33FF00"  >Hello , <a href="#" style="color:#ffffff   ">
                              <% out.println(session.getAttribute("fname"));%>
                            </a></h4>
		  </div>	
	</div>
                            
    	<div class="profile_details" style="padding-right:1%;top:-10%;">						 
			 <div class="profile_img">	
                             <a href="#"><img src="../images/pp/arun.jpg" width="80" height="80" alt="" /></a>								
			</div>		
			 <a href="#">
                             <img src="../images/form/arrow.png" alt="" onClick="clicked(1)" />	
			  </a>   
			<div class="clear"></div>		  	
    	</div>	 
        
        
        
      
        
         <div class="heading" style="width:40%;margin:0 auto;margin-top:2%	">	   				
           	<div class="heading_name">
                <h3 id="heading">Insta - Review Collection</h3>
            </div>
	  </div>    
         
 <%
    String name= (String) session.getAttribute("name");
    Class.forName("oracle.jdbc.driver.OracleDriver");
    Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "system", "123");
    Statement stmt = conn.createStatement();
    Statement st = conn.createStatement();
     
    String id;
    String img;
    int rating;
    String comments;
    int i=10;
    String c1,c2,c3,c4,c5;
   
    String query = "select * from movie";
    //String comments="select * from comment_table where comm !='null'";
            
    
 %>        
         <!-- Main Body -->
         
   <div class="main">  
	<div class="wrap" style="padding:2.3%">
          
       
    
<div class="column_left">
            
<%
    ResultSet resultset = stmt.executeQuery(query); 
    int c=3;
    while(resultset.next())
    {
          comments="select * from comment_table where comm !='null'";
         
            id=resultset.getString("m_id");
               comments="select * from comment_table where comm !='null' and  mid='"+id+"'";
                i=st.executeUpdate(comments);
            img=resultset.getString("pic1");
            rating=(int)Float.parseFloat(resultset.getString("rating"))/2;
            
            
            if(c % 3 == 0)
            {
              int r=(int)(((Math.random())*101)+1);
              String myi="img1";
              
              if(r % 3 != 0)
                  myi="img2";
              else
                  myi="img1";
              
              c5=(rating==5) ? "checked":"";
              c4=(rating==4) ? "checked":"";
              c3=(rating==3) ? "checked":"";
              c2=(rating==2) ? "checked":"";
              c1=(rating==1) ? "checked":"";
            
%>            
<div class="weather" onclick="midpasser(<%out.println(id);%>)">		              
		<div class="today_temp">
                    
                    <img src="<% out.println(img);%>" class="<% out.println(myi);%>;"  alt="" />								
    	        </div>
		<div class="temp_list">
		   <ul>
			<li>
			    <a href="#">
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
				<label class="digits">
                                    <i>
					<img class="img1" src="../images/form/comments.png" alt="" />
				    <%=i%>
                                    
                                    </i>
                                    
				</label>
				<div class="clear"></div>
			    </a>
			 </li>									
		    </ul>
		</div>
	    </div> 
            <% 
            } 
            c++;
            }%>
        </div>         
                
<!-- Middle Column Ends --> 
<div class="column_middle">
            
            
<%
    ResultSet resultset2 = stmt.executeQuery(query); 
    int counter2=3;
    while(resultset2.next())
    {
            id=resultset2.getString("m_id");
            img=resultset2.getString("pic1");
             comments="select * from comment_table where comm !='null' and  mid='"+id+"'";
                i=st.executeUpdate(comments);
            rating=(int)Float.parseFloat(resultset2.getString("rating"))/2;
            
            
            if(counter2 % 3 == 1)
            {
              int r2=(int)(((Math.random())*101)+1);
              String myim="img1";
              
              if(r2 % 3 != 0)
                  myim="img2";
              else
                  myim="img1";
              
              c5=(rating==5) ? "checked":"";
              c4=(rating==4) ? "checked":"";
              c3=(rating==3) ? "checked":"";
              c2=(rating==2) ? "checked":"";
              c1=(rating==1) ? "checked":"";
    

%>            
       
<div class="weather" onclick="midpasser(<%out.println(id);%>)">		              
		<div class="today_temp">
                    
                    <img src="<% out.println(resultset2.getString("pic2"));%>" class="<% out.println(myim);%>;"  alt="" />								
    	        </div>
		<div class="temp_list">
		   <ul>
			<li>
			    <a href="#">
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
				<label class="digits">
                                    <i>
					<img class="img1" src="../images/form/comments.png" alt="" />
				    <%=i%>
                                    
                                    </i>
				</label>
				<div class="clear"></div>
			    </a>
			 </li>									
		    </ul>
		</div>
	    </div> 
            <% 
            } 
            counter2++;
            }%>

 </div>



<!-- Right Column Ends -->
      <div class="column_right">   
            
       <%
    ResultSet result = stmt.executeQuery(query); 
    int c33=3;
    while(result.next())
    {
            id=result.getString("m_id");
            img=result.getString("pic1");
             comments="select * from comment_table where comm !='null' and  mid='"+id+"'";
                i=st.executeUpdate(comments);
            rating=(int)Float.parseFloat(result.getString("rating"))/2;
            
            
            if(c33 % 3 == 2)
            {
              int r=(int)(((Math.random())*101)+1);
              String myi="img1";
              
              if(r % 3 != 0)
                  myi="img2";
              else
                  myi="img1";
              
              c5=(rating==5) ? "checked":"";
              c4=(rating==4) ? "checked":"";
              c3=(rating==3) ? "checked":"";
              c2=(rating==2) ? "checked":"";
              c1=(rating==1) ? "checked":"";
            
%>            
           <div class="weather" onclick="midpasser(<%out.println(id);%>)">		              
		<div class="today_temp">
                    
                    <img src="<% out.println(img);%>" class="<% out.println(myi);%>;"  alt="" />								
    	        </div>
		<div class="temp_list">
		   <ul>
			<li>
			    <a href="#">
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
				<label class="digits">
                                    <i>
					<img class="img1" src="../images/form/comments.png" alt="" />
				 <%=i%>
                                    
                                    </i>
				</label>
				<div class="clear"></div>
			    </a>
			 </li>									
		    </ul>
		</div>
	    </div> 
            <% 
            } 
            c33++;
            
            }%>
      </div>
            
            
            
            
            
            
            
          
    </div>
  </div>
         
         <!-- Main BOdy Ends -->
        
    <%conn.close();%>    
    </body>

</html>
