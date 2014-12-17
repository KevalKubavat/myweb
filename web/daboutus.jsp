<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="UTF-8">
    <title>Contact Us</title>  
<link rel="stylesheet" type="text/css" href="css/styles.css">
<link rel="stylesheet" type="text/css" href="css/style_1.css">
<link rel="stylesheet" media="screen" href="css/styles_1.css" >

    </head>
    <body>  
       
      <div class="container">  
    <header>
    <!--start logo-->
    <a href="#" id="logo"><img src="imgs/text1.jpg" width="301" height="170" alt="logo" class="rotate" title="Cloud Logo"></a>    
   <div class="fonthere loginname" title="cloud drive welcomes you..!">Welcome
        <%=session.getAttribute("name")%></div>
    <form action="logout" method="post">
            
<input type="submit" name="submit" value="Logout" title="Logout" class="logoutbuton button1"/></form>
	<!--end logo-->
   <!--start menu-->
   
    <nav>
    <ul>
        <li><a href="ahome.jsp" title="Home">Home</a></li>
        <li><a href="bmydrive.jsp" title="YOur drive">My Drive</a></li>
        <li><a href="checkprofileServlet" title="your profile">My Profile</a></li>
        <li><a href="#"   class="current" title="Contact us">Contact Us</a></li>      
        <li><a href="efeedback.jsp" title="YOur Feedback">Feedback</a></li>
    </ul>
    </nav>
	<!--end menu-->
    <!--end header-->
	</header> 
          <header class="headersize">
               <img class="pho1" src="imgs/imgkknew.jpg" banner="k" height="150" width="150" title="Mr. Keval Kubavat.">
             
                  <h3 class="nameid1"> Kubavat Keval </h3>
                  <h3 class="nameid1"> Email: kevalkubavat001@gmail.com </h3>
              
              <img class="pho2" src="imgs/AKASHnew.jpg" banner="A" height="170" width="150" title="Mr. Akash Thakor.">
              
                  <h3 class="nameid2"> Thakor Akash</h3>
                  <h3 class="nameid2"> Email: akash.sky1000@gmail.com </h3>
              
              <img class="pho3" src="imgs/newkap.jpg" banner="k" height="170" width="150" title="Mr. Kapil Mathar.">
               
                   <h3 class="nameid3"> Mathar kapil </h3>
                   <h3 <h3 class="nameid3"> Email: Kapil_147@rediffmail.com</h3>
             
             </header>  
              
              
             </header>  
          
          <footer>
              <div class="container">
               <div id="FooterTwo" title="My Cloud Drive"> © 2015 My Cloud Drive</div>
   <div id="FooterTree" title="Designed By Keval Kubavat , Kapil Mathar , Akash Thakor.">Created  &amp; Designed By Keval Kubavat , Kapil Mathar , Akash Thakor.</div> 
   </div>
             
          </footer>
      </div>   
      
  
    </body>
</html>
    

