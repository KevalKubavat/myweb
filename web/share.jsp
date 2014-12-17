<%@page import="java.io.File"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="javax.swing.JOptionPane"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="UTF-8">
    <title>MyDrive</title>  
<link rel="stylesheet" type="text/css" href="css/styles.css">
<link rel="stylesheet" type="text/css" href="css/style_1.css">
<link rel="stylesheet" media="screen" href="css/styles_1.css" >

<style type="text/css">
    .borderlayout{
    
    box-shadow: 0 1px 3px rgba(0, 0, 0, 0.15) inset, -5px -5px 0 0 #F5F5F6, 5px 5px 0 0 #F5F5F6, 5px 0 0 0 #F5F5F6, 0 5px 0 0 #F5F5F6, 5px -5px 0 0 #F5F5F6, -5px 5px 0 0 #F5F5F6; 
    padding: 14px 20px ;
    }

.textboxwidth{
    
    width: 250px;
    margin-left: 220px;
}
</style>

    </head>
    <body>  
       
      <div class="container">  
    <header>
    <!--start logo-->
    <a href="#" id="logo"><img src="imgs/text1.jpg" width="301" height="170" alt="logo" class="rotate"></a>    
    
    <div class="fonthere loginname" title="cloud drive welcomes you..!">Welcome <%=session.getAttribute("name")%></div>
    <form action="login.jsp" >
        <input class="logoutbuton button1" id="submit" type="submit" name="logout" value="logout">
    </form>
	<!--end logo-->
   <!--start menu-->
   
    <nav>
    <ul>
        <li><a href="ahome.jsp">Home</a></li>
        <li><a href="#"  class="current">My Drive</a></li>
        <li><a href="cmyprofile.jsp">My Profile</a></li>
        <li><a href="daboutus.jsp">Contact Us</a></li>      
        <li><a href="efeedback.jsp">Feedback</a></li>
    </ul>
    </nav>
	<!--end menu-->
    <!--end header-->
    	
    </header> 
          <header class="headersize2">
              
               
              
              
             <div class="insidehright">
                 <br/><br/>
                 <h1>Select User For Sharing...</h1>
                 
                 <br/><br/>
                 
                 <%
                    String fname = request.getParameter("fn");
                    String filepth = fname.substring(fname.lastIndexOf("\\")+1);
                    session.setAttribute("sharedfilename", filepth);
                 %>
            
                 <form action="share" method="post">
                     <h2>Enter User id : </h2>
                     <input title="Enter the user id." type="text" name="id" placeholder="Enter Registered User Id" class="borderlayout textboxwidth"/>
                     <input type="submit" name="submit" value="submit" class="button1" title="Share" />
                 </form>
                 
                 
             </div>  
              
           
</header>  

          
          <footer>
              <div class="container">
              <div id="FooterTwo" title="My Cloud Drive"> © 2015 My Cloud Drive</div>
   <div id="FooterTree" title="Designed By Keval Kubavat , Kapil Mathar , Akash Thakor.">Created  &amp; Designed By Keval Kubavat , Kapil Mathar , Akash Thakor.</div> 
   </div>
              </div> 
          </footer>
      </div>   
      
  
    </body>
</html>
    

