<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="UTF-8">
    <title>FeedBack</title>  
<link rel="stylesheet" type="text/css" href="css/styles.css">
<link rel="stylesheet" type="text/css" href="css/style_1.css">
<link rel="stylesheet" media="screen" href="css/styles_1.css" >
<script language="javascript">
    function feedvalidateForm(){
        //validation for name
    var a=document.forms["feed_form"]["name1"].value;
    if (a==null || a=="")
      {
      alert("please Enter your id ");
      return false;
      }
      var d=document.forms["feed_form"]["feedback"].value;
    if (d==null || d==""){
      alert("please Enter your feedback");
      return false;
      }
      else
      {
          return true;
      }
          
  }
</script>
    </head>
    <body>  
       
      <div class="container">  
    <header>
    <!--start logo-->
    <a href="#" id="logo"><img src="imgs/text1.jpg" width="301" height="170" alt="logo" class="rotate"></a>    
    <div class="fonthere loginname" title="cloud drive welcomes you..!">Welcome
        <%=session.getAttribute("name")%></div>
    <form action="logout" method="post" >
            
<input type="submit" name="submit" value="Logout" title="Logout" class="logoutbuton button1"/></form>
	<!--end logo-->
   <!--start menu-->
   
    <nav>
    <ul>
        <li><a href="ahome.jsp">Home</a></li>
        <li><a href="bmydrive.jsp" >My Drive</a></li>
        <li><a href="checkprofileServlet">My Profile</a></li>
        <li><a href="daboutus.jsp" >Contact Us</a></li>      
        <li><a href="#" class="current">Feedback</a></li>
    </ul>
    </nav>
	<!--end menu-->
    <!--end header-->
	</header> 
          <header class="headersize">
              <form class="contact_form" onsubmit="return feedvalidateForm()" action="feedverify" method="post" name="feed_form">

<ul>
    <li>
         <h2>FeedBack Form</h2>
         
    </li>
    <li>
        <label for="name">Your ID:</label>
        <%=session.getAttribute("userid")%> 
    </li>




<li>

    <label for="feedback">Feedback:</label>

    <textarea name="feedback" cols="40" rows="6"  title="Give Your Idea..">
</textarea>
</li>

<li>

    <button class="submit" type="submit" title="Submit Your feed..">Submit Form</button>

</li>

</ul> 


</form> 
             </header>  
 
          
          <footer>
              <div class="container">
               <div id="FooterTwo"> © 2015 My Cloud Drive</div>
   <div id="FooterTree">Created  &amp; Designed By Keval Kubavat , Kapil Mathar , Akash Thakor.</div> 
   </div>
              </div> 
          </footer>
      </div>   
      
  
    </body>
</html>
    

