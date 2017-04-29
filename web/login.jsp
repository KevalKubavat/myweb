<%-- 
    Document   : login
    Created on : 13 Aug, 2014, 10:58:56 PM
    Author     : Kps
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <script language="javascript">
            function validateLogin(){
            var a=document.forms["login"]["user"].value;
            if (a==null || a=="")
            {
                alert("please Enter your Name ");
                return false;
            }
            var b=document.forms["login"]["pass"].value;
            if (b==null || b=="")
            {
                alert("please enter password");
                return false;
            }
            
    }
        </script>
        <title>Log-In</title>
        <link rel="stylesheet" href="css/style1.css" media="screen" type="text/css" />
    </head>
    <body>
        <div class="move">
            <a href="#" title="My Cloud"><img src="imgs/logo_1.jpg"></a>
        </div>
        <div class="login-card move1 ">
            <h1 class="loginiside">LOG-HERE</h1><br>
            <form  name="login" onsubmit="return validateLogin()" action="check1"  method="post" >
        <input title="Enter Your ID." type="text" name="user" placeholder="UserId">
        <input title="Enter Your Password." type="password" name="pass" placeholder="Password">
        <input type="submit" name="login" class="login login-submit" value="login" title="Login" >
        </form>
        <div class="login-help">
            <a href="signup.jsp" title="Register">Register</a> • <a href="forgotpass.jsp" title="Forgot Password">Forgot Password</a>
        </div>
        
        </div>
    </body>
</html>
