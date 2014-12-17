
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="UTF-8">
    <title>MainHome1</title>  
<link rel="stylesheet" type="text/css" href="css/styles.css">
<link rel="stylesheet" type="text/css" href="css/style_1.css">
<link rel="stylesheet" media="screen" href="css/styles_1.css" >
<script type="text/javascript" src="js/jquery.min.js"></script>
  <script type="text/javascript" src="js/jquery.easing.min.js"></script>
  <script type="text/javascript" src="js/jquery.nivo.slider.pack.js"></script>
<script type="text/javascript">
    $(window).load(function() {
        $('#slider').nivoSlider();
    });
    </script>
    </head>
    <body>  
        <%
                //String userid = session.getAttribute("userid");
                //String nm = (String)request.getAttribute("nm");
                //String userps = (String)request.getAttribute("userps");
                //session.setAttribute("usernm", nm);
                
                
          %>
      <div class="container"> 
          
    <header>
    <!--start logo-->
    <a href="ahome.jsp" id="logo"><img src="imgs/text1.jpg" width="301" height="170" class="rotate" title="Cloud Logo"></a>
    
    <div class="fonthere loginname" title="cloud drive welcomes you..!"> Welcome 
        <%=session.getAttribute("name")%></div>
   
        <form action="logout.jsp" method="post" >
            
        <input type="submit" name="submit" value="Logout" title="Logout" class="logoutbuton button1"/></form>
    
	<!--end logo-->
   <!--start menu-->
   
    <nav>
    <ul>
        <li ><a href="#" class="current" title="Home">Home</a></li>
        <li><a href="bmydrive.jsp" title="Your Drive">My Drive</a></li>
        <li><a href="checkprofileServlet" title="Your Profile">My Profile</a></li>
        <li><a href="daboutus.jsp" title="Contact Us">Contact Us</a></li>      
        <li><a href="efeedback.jsp" title="YOur Feedback">Feedback</a></li>
        
    </ul>
    </nav>
	<!--end menu-->
    <!--end header-->
	</header> 
          <header class="headersize">
              <div id="banner_image">
	    <div id="slider-wrapper">
          <div id="slider" class="nivoSlider">
            <img src="imgs/1.jpg" alt="" title="File Security"/>
            
            <img src="imgs/2.jpg" alt="" title="Secure Data" />
           
            <img src="imgs/4.jpg" alt="" title="File Sharing"/>
            
           
		  </div><!--close slider-->
		</div><!--close slider_wrapper-->
               
             </header>  
        <a href="#" class="image1shareanyhere"><img src="imgs/store any file.png" height="200" width="200" title="Share Any File"></a>
        
        <div class="image1storingfilefont"> Store Any File</div>
        <div class="container1">
        
            Drive starts you with 10MB of free Cloud Drive storage, <br>
so you can keep pictures, stories, designs, drawings, <br> ? anything.
        </div>
        <a href="#" class="imagefiles"><img src="imgs/file1.jpg" height="250" width="250" title="files And Folder"></a>
        <div class="container2">Share files and folders</div>        
        <div class="filesandfolder">
            You can quickly invite others to view, download, and collaborate<br>
            on all the files you want.
        </div>              
<div class="container">
                  <footer>
               <div id="FooterTwo" title="My Cloud Drive"> © 2015 My Cloud Drive</div>
   <div id="FooterTree" title="Designed By Keval Kubavat , Kapil Mathar , Akash Thakor.">Created  &amp; Designed By Keval Kubavat , Kapil Mathar , Akash Thakor.</div> 
  
          </footer>
      </div>   
      
  
    </body>
</html>
    

