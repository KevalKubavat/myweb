<%-- 
    Document   : forgotpass
    Created on : Sep 4, 2014, 11:53:58 PM
    Author     : kapilmathar
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Forgot Password</title>
        <link rel="stylesheet" href="css/forgotstyle_1.css" media="screen" type="text/css" />
        <script language="javascript">
            function validateForm(){
                
                var d=document.forms["Rform"]["email"].value;
                if (d==null || d==""){
                alert("please Enter Email");
                return false;
                }else{
                    var mailformat = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
                    if(d.match(mailformat))
                    {
                        document.Rform.email.focus();
                        //return true;
                    }
                    else
                    {
                        alert("You have entered an invalid email address!");
                        document.Rform.email.focus();
                        return false;
                    }
                  }
            }
        </script>
    
    </head>
    <body background="imgs/bg.png">
        
        <div  id="signup-form">
           <fieldset>
               <legend>
                   Forgot Password menu:
               </legend>
               <form onsubmit="return validateForm();" action="SendEmail" method="post" name="Rform">
                   <center>
                   <table>
                   <tr>
                       <th><label  class="text">Enter your email Id:&nbsp;&nbsp;&nbsp;</label></th>
                       <td><input title="Enter Your Email Address which You have assined in the Registration Form." class="textarea" size="25" type="text" name="email" ></td>
                   </tr>
                   <tr>
                       
                   </tr>
                   <tr>
                       <td><br><br><br><br></td>
                       <td> <input title="Submit And See Your Email The mail Has Been send To Your Email.....see the given note" id="submit" type="submit" name="submit" value="submit"></td>
                   </tr>
               </table> 
                   </center>
               </form>
           </fieldset>
            <br>
           <fieldset>
               <legend>
                   Disclamer: 
               </legend>
               <p class="text">As your password will be send to you through the mail which you will be assign in the above field.
                      So please enter your correct email. 
               </p>
               
           </fieldset>
        </div>
    </body>
    
</html>
