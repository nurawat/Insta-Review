<%-- 
    Document   : login
    Created on : Oct 29, 2016, 4:46:55 PM
    Author     : Arun Rawat
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
    	<title> Login | SignUp </title>
        <link type="text/css" rel="stylesheet" href="../CSS/login.css"/>
        <link type="text/css" rel="stylesheet" href="../CSS/index.css"/>
         <link type="text/css" rel="stylesheet" href="../CSS/card.css"/>
         <%
             String att=request.getParameter("att");
             
        %>
         
         <script type="text/javascript">
                        function myload()
                        {
                            if(<%= att %> ==1)
                            {
                                document.getElementById("wrong").innerHTML="WRONG Username or Password !!!";
                                document.getElementById("wrong").style.visibility="visible";
                            }
                        }
		 	function s()
			{  
					
				window.location="signup.jsp?att=0";
			        			
	
			}
			function l()
			{   
                            
                            if(  validateEmail(document.getElementById("email").value)  &&   
                                    document.getElementById("pass").value!="")
                            {
                                
                                window.location="jsp_pages/login_checker.jsp?email="
                               +document.getElementById("email").value+"&pass="+document.getElementById("pass").value;
			        
                            }
                            
                            
                            else
                            {                   
 
                                document.getElementById("wrong").innerHTML="Wrong Fields Detected !!!";
                                document.getElementById("wrong").style.visibility="visible";
                            }
                                
                             
			}
                        function validateEmail(value)
                        {        
                            var pattern =  /\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*/;
                            return pattern.test(value);   
                        }   
		 </script>
    </head>
    
    
    <body class="body" onload="myload()">
        
          		
			    <div class="heading" style="width:30%;margin:0 auto;margin-top:2%	">	   				
           			 <div class="heading_name">
                		<h3 id="heading">Login Form </h3>
            		</div>
	   			 </div>                 
   
                                <div class="login" id="login">	
                                    <form name="myform" method="post" id="f" action="jsp_pages/login_checker.jsp">
					  <li>
						<input type="text" class="text" placeholder="example@someone.com..." 
                                                       name="email" style="padding-left:2%" 
                                                       onFocus="this.value = '';" 
                                                       onBlur="if (this.value == '') {this.value = '';}"
                                                       id="email">								
					  </li>
					
					
					<li>
						<input type="password" placeholder="password..." 
                                                       onFocus="this.value = '';"  class="password"
                                                       onBlur="if (this.value == '') {this.value = '';}" 
                                                       style="padding-left:2%" 
                                                       name="pass"
                                                       id="pass">
						
					</li>	
                                        <p id="wrong" align='center'
                                           style="margin: 2px;color:#33FF00;padding: 10px;visibility:hidden;
                                           font: 14px;font-family:'Calibri'" 
                                         ></p>
                 
						<input type="button" class="submit" value="Sign Up" onClick="s()"> &nbsp;&nbsp;&nbsp;                  
                                                <input type="button" class="submit" value="Login"  onClick="l()">	   
                                  
					 </form>
                   
               </div>            
               
               
               
               
     
    </body>
</html>