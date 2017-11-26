<%-- 
    Document   : signup
    Created on : Oct 30, 2016, 1:59:39 AM
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
         
         <%String att=request.getParameter("att");%>
         <script type="text/javascript">
		<!-- 
                function myLoad()
                {
                    if(<%= att %>==1)
                    {
                           document.getElementById("wrong").innerHTML="User Already Exists !!!";
                           document.getElementById("wrong").style.visibility="visible";
                    }
                }
                 function signupCheck()
                 {
                     var fname=document.getElementById("fname").value;
                     var lname=document.getElementById("lname").value;
                     var email=document.getElementById("email").value;
                     var uname=document.getElementById("username").value;
                     var pass=document.getElementById("pass").value;
                    
                     if(validateEmail(email))
                     {
                         if((isNaN(fname) || fname !="") && (isNaN(lname) || lname !="") )
                         {
                             if(uname===pass)
                             {
                                 
                                 window.location="jsp_pages/signup_checker.jsp?fname="+fname+"&lname="+lname+
                              "&email="+email+"&uname="+uname+"&pass="+pass;
                             }
                             else
                             {
                                 document.getElementById("wrong").innerHTML="Password Doesn't Match !!!";
                             }
                         }
                         else
                         {
                              document.getElementById("wrong").innerHTML="Wrong First Name Detected !!!";                            
                         }
                     }
                     else
                     {
                         document.getElementById("wrong").innerHTML="Wrong Email ID Detected !!!";
                     }
                 }
        
                 
                 function validateEmail(value)
                 {        
                    var pattern =  /\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*/;
                    return pattern.test(value);   
                 } 
                -->
	 </script>
    </head>
    
    
    <body class="body" onload="myLoad()">
        
          		
			    <div class="heading" style="width:30%;margin:0 auto;margin-top:2%	">	   				
           			 <div class="heading_name">
                		<h3 id="heading">Signup Form </h3>
            		</div>
	   			 </div>                 
   
                <div class="login" id="login" >	
                    <form name="myform" method="post" action="jsp_pages/signup_checker.jsp" > 
                    	<input type="text" class="submit" placeholder="First Name" name="fname" style="
                        outline:1px solid #B4B2B2;width:40%;padding-left:2%;border-radius:0px;" 
                        onFocus="this.value = '';" onBlur="if (this.value == '') {this.value = '';}"
                        id="fname"> 
                        
                        <input type="text" class="submit" placeholder="Last Name" name="lname" style="
                        outline:1px solid #B4B2B2;width:40%;padding-left:2%;border-radius:0px;margin-left:3%" 
                        onFocus="this.value = '';" onBlur="if (this.value == '') {this.value = '';}"
                        id="lname"> 
                        <br/><br>
                      
			 <li>                             
                         <input type="text" class="text" placeholder="someone@example.com" 
                                name="email" style="padding-left:2%" 
                                onFocus="this.value = '';" onBlur="if (this.value == '') {this.value = '';}"
                                id="email">								
			</li>     
                        
                        
                        <li>
			<input type="password" class="text" placeholder="password" name="pass2" style="padding-left:2%" 
                        onFocus="this.value = '';" onBlur="if (this.value == '') {this.value = '';}"
                        id="username">								
			</li>
					
					
			<li>
                            <input type="password" placeholder="confirmpassword" onFocus="this.value = '';"  class="password"
                            onBlur="if (this.value == '') {this.value = '';}" style="padding-left:2%" name="pass"
                            id="pass">
			</li>	
                        
                        <p id="wrong" align='center'
                             style="margin: 2px;color:#33FF00;padding: 10px;
                             font: 14px;font-family:'Calibri';" 
                             
                        ></p>
                        
                         <input type="button" class="submit" value="SignUp" style="width:100%;margin:0 auto" 
                                onclick="signupCheck()">	   
                                       
                    </form>
                   
               </div>            
               
               
               
               
     
    </body>
</html>