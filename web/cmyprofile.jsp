<%@page import="javax.swing.JOptionPane"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="UTF-8">
    <title>MyProfile</title>  
<link rel="stylesheet" type="text/css" href="css/styles.css">
<link rel="stylesheet" type="text/css" href="css/style_1.css">
<link rel="stylesheet" media="screen" href="css/styles_1.css" >

<script language="javascript">
    function myprovalidate(){
      var a=document.forms["my_profile"]["name"].value;
    if (a==null || a=="")
      {
      alert("please Enter your Name ");
      return false;
      }
  var d=document.forms["my_profile"]["email"].value;
    if (d==null || d==""){
      alert("please Enter Email");
      return false;
      }else{
        var mailformat = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
        if(d.match(mailformat))
        {
        document.my_profile.email.focus();
        //return true;
        }
        else
        {
        alert("You have entered an invalid email address!");
        document.my_profile.email.focus();
        return false;
        }
      }
      //password
      var b=document.forms["my_profile"]["pass"].value;
    if (b==null || b=="")
      {
      alert("please Enter password");
      document.my_profile.pass.focus();
      return false;
      }
      //
       var i=document.forms["my_profile"]["mno"].value;
    if (i==null || i=="")
      {
      alert("please Enter Phone No");
      document.my_profile.mno.focus();
      return false;

      }

       if(isNaN(i)|| i.indexOf(" ")!=-1)
        {
                            alert("Enter numeric value");
            document.my_profile.mno.focus();    
            return false;
                    }
                     if (i.length >10)
                {
                                alert("enter 10 characters"); 
            document.my_profile.mno.focus();        
            return false;
                         }
     
    }
</script>
    </head>
    <body> 
        
        <%
            String id = (String)request.getAttribute("id");
            String user=(String)request.getAttribute("name");
            String pass=(String)request.getAttribute("pass");
            String email=(String)request.getAttribute("email");
            String dob=(String)request.getAttribute("dob");
            String gendr=(String)request.getAttribute("gendr");
            String mo=(String)request.getAttribute("mo");
            String loc=(String)request.getAttribute("loc");
            boolean flag = false ;
            
            if(gendr.matches("Male"))
            {
                
                flag = true ;
            }
            
        %>

       
      <div class="container">  
    <header>
    <!--start logo-->
    <a href="#" id="logo"><img src="imgs/text1.jpg" width="301" height="170" class="rotate"></a>    
   <div class="fonthere loginname" title="cloud drive welcomes you..!">Welcome 
        <%=session.getAttribute("name")%></div>
    
    <form action="logout" method="post">
            
<input type="submit" name="submit" value="Logout" title="Logout" class="logoutbuton button1"/></form>
	<!--end logo-->
   <!--start menu-->
   
    <nav>
    <ul>
        <li><a href="ahome.jsp">Home</a></li>
        <li><a href="bmydrive.jsp" >My Drive</a></li>
        <li><a href="#"  class="current">My Profile</a></li>
        <li><a href="daboutus.jsp">Contact Us</a></li>      
        <li><a href="efeedback.jsp">Feedback</a></li>
    </ul>
    </nav>
	<!--end menu-->
    <!--end header-->
	</header> 
          <header class="headersize3">
              <form class="contact_form" onsubmit="return myprovalidate()" action="updateprofile" method="post" name="my_profile">

<ul>
    <li>
         <h2>My Profile</h2>
         
    </li>
    <li>
        <label for="ID" title="Your Unique id.">Your ID:</label>
        <% out.println(""+id+""); %>
        
    </li>
    <li>
            <label for="name">Your Name:</label>
        <input title="Enter your name" type="text" name="name" value="<% out.println(""+user+""); %>"/>
    </li>
<li>
    <label for="email">Email:</label>
    <input title="Enter your email in which the mail will be send later." type="text" name="email" value="<% out.println(""+email+""); %>" />
</li>

<li>
    <label for="password">Password:</label>
    <input title="Enter your password" type="text" name="pass" value="<% out.println(""+pass+""); %>"/>
</li>

<li>
    <label for="date">Birth Date:</label>
    <input  title="Eneter Your Birthdate in dd/mm/yyyy format."type="text" name="dob" value="<% out.println(""+dob+""); %>" />
</li>
<li>
                <label for="gender" >Gender</label>
                
                    <%if(flag == true){%>
                    
                    <input  title="If male" type="radio" name="gender" value="Male" checked=""   > Male
                    <input  title="If Female" type="radio" name="gender" value="Female" >Female
                    <%}else
                    {%>
                    
                        <input title="If male" type="radio" name="gender" value="Male"> Male
                        <input title="If Female" type="radio" name="gender" value="Female" checked="" >Female
                    
                    <%}%>
                         
                    
                        
                        
                        
                       
                
                
                
            </li>


<li>
    <label for="mobno">Mobile Number:</label>
    <input title="Enter your Mobile Number." type="text" name="mno" value="<% out.println(""+mo+""); %>" />
</li>
<li>
        <label for="Lname">Location:</label>
        <input title="Enter your Location." type="text" name="loc" value="<% out.println(""+loc+""); %>" />
    </li>

<li>
    <button class="submit" type="submit" title="Update your profile.">Update</button>
</li>
</ul> 
</form>
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
    

