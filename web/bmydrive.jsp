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
<link rel="stylesheet"  type="text/css" href="css/tablecss.css">
<style type="text/css">
     .button {
   border: 2px solid #0a3c59;
   background: cornflowerblue;
   background: -webkit-gradient(linear, left top, left bottom, from(cornflowerblue), to(#20911e));
   background: -webkit-linear-gradient(top, #cornflowerblue, #20911e);
   background: -moz-linear-gradient(top, #cornflowerblue, #20911e);
   background: -ms-linear-gradient(top, #cornflowerblue,#20911e);
   background: -o-linear-gradient(top, #cornflowerblue, #20911e);
   background-image: -ms-linear-gradient(top, #cornflowerblue 0%, #cornflowerblue 100%);
   padding: 5px 15px;
   -webkit-border-radius: 5px;
   -moz-border-radius: 5px;
   border-radius: 5px;
   -webkit-box-shadow: rgba(255,255,255,0.4) 0 0px 0, inset rgba(255,255,255,0.4) 0 1px 0;
   -moz-box-shadow: rgba(255,255,255,0.4) 0 0px 0, inset rgba(255,255,255,0.4) 0 1px 0;
   box-shadow: rgba(255,255,255,0.4) 0 0px 0, inset rgba(255,255,255,0.4) 0 1px 0;
   text-shadow: #7ea4bd 0 1px 0;
   color: #C7EDFF;
   font-size: 20px;
   font-family: helvetica, serif;
   text-decoration: none;
   vertical-align: middle;
   }
.button:hover {
   border: 2px solid #0a3c59;
   text-shadow: #1e4158 0 1px 0;
   background: #3e779d;
   background: -webkit-gradient(linear, left top, left bottom, from(#65a9d7), to(#3e779d));
   background: -webkit-linear-gradient(top, #65a9d7, #3e779d);
   background: -moz-linear-gradient(top, #65a9d7, #3e779d);
   background: -ms-linear-gradient(top, #65a9d7, #3e779d);
   background: -o-linear-gradient(top, #65a9d7, #3e779d);
   background-image: -ms-linear-gradient(top, #65a9d7 0%, #3e779d 100%);
   color: #fffcff;
   }
.button:active {
   text-shadow: #1e4158 0 1px 0;
   border: 2px solid #0a3c59;
   background: #65a9d7;
   background: -webkit-gradient(linear, left top, left bottom, from(#3e779d), to(#3e779d));
   background: -webkit-linear-gradient(top, #3e779d, #65a9d7);
   background: -moz-linear-gradient(top, #3e779d, #65a9d7);
   background: -ms-linear-gradient(top, #3e779d, #65a9d7);
   background: -o-linear-gradient(top, #3e779d, #65a9d7);
   background-image: -ms-linear-gradient(top, #3e779d 0%, #65a9d7 100%);
   color: #fff;
   }
    .button2 {
   border: 2px solid #0a3c59;
   background: #0ad;
 
   padding: 5px 15px;
 
   border-radius: 5px;
  
   box-shadow: rgba(255,255,255,0.4) 0 0px 0, inset rgba(255,255,255,0.4) 0 1px 0;
   text-shadow: #7ea4bd 0 1px 0;
   color: #C7EDFF;
   font-size: 20px;
   font-family: helvetica, serif;
   text-decoration: none;
   vertical-align: middle;
   }
.button2:hover {
   border: 2px solid #0a3c59;
   text-shadow: #1e4158 0 1px 0;
   background:#00c6ff;

   color: #fffcff;
   }
</style>
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
        <li><a href="#"  class="current" title="Your Drive">My Drive</a></li>
        <li><a href="checkprofileServlet" title="YOur Profile">My Profile</a></li>
        <li><a href="daboutus.jsp" title="Contact Us">Contact Us</a></li>      
        <li><a href="efeedback.jsp" title="YOur Feedback">Feedback</a></li>
    </ul>
    </nav>
	<!--end menu-->
    <!--end header-->
    	
    </header> 
          <header class="headersize2">
              
               
              
              
             <div class="insidehright">
                 <br/><br/>
                 <h3 class="fontchoose"> Choose File to Upload in Server </h3>
                 <div class="fileupload">Max file size to upload : 10 MB</div>
                 
                 <form action="upload" method="post" enctype="multipart/form-data" >
                <input class="fileupload1" type="file" name="file" title="Browse Your File Here." />       <input type="submit" value="upload" class="button" title="Upload Your File."/>
            </form> 
             
                 <br/><br/>
                 
                 <%
            
            try{
                
        Class.forName("com.mysql.jdbc.Driver");
        Connection con=DriverManager.getConnection("jdbc:mysql://122.123.124.127:3306/myclouddrive","root","");
        JOptionPane.showMessageDialog(null, "connected to databse..");
            
            //int id = <%=session.getAttribute("name")%>
        <%    
            Statement ps = con.createStatement();
            ResultSet rs =  ps.executeQuery("select * from file where id ="+session.getAttribute("userid"));
        %>
                 
                 <table cellspacing='0' class="tablesize">
            <!--table header-->
            <thead>
                <tr>
                    
                    <th title="Name of the files.">Names</th>
                    <th title="File Size."class="cellspacingsize">Size</th>
                    <th title="File to be downloaded."class="cellspacing">Download</th>
                    <th title="Share the file."class="cellspacing">Share</th>
                    <th title="Delete the file if you want to delete."class="cellspacing">Delete</th>
                    <th title="To whom the file was shared."class="cellspacingremark">Remark</th>
                </tr>
            </thead>
            
            <%
           
                int i = 0;
                while(rs.next())
                {
                    String fname = rs.getString(2);
                    String remarks = rs.getString(3);
                    String fname1 = "D:\\files\\" + fname;
                    fname1.trim();
                    //JOptionPane.showMessageDialog(null , fname);
                    File file =new File(fname1);   
                    //JOptionPane.showMessageDialog(null , file);
                    double bytes = file.length();
                    double kilobytes = (bytes / 1024);
                    //JOptionPane.showMessageDialog(null , kilobytes);
                    double megabytes = (kilobytes / 1024);
                    //double gigabytes = (megabytes / 1024);
                    //double terabytes = (gigabytes / 1024);
                    //double petabytes = (terabytes / 1024);
                    //double exabytes = (petabytes / 1024);
                    //double zettabytes = (exabytes / 1024);
                    //double yottabytes = (zettabytes / 1024);
		    
                    
            %>
            <!-- ------------- -->
            <!--table body-->
            <tbody>
                <tr>
                    
                    <td><%= fname %></td>
                    <td><%= kilobytes%> kb</td>
                    <td><form action="DownloadFileServlet?fn=<%=fname%>" method="post"><input class="button2" type="submit" name="download" value="download"/></form></td>
                    <td><form action="share.jsp?fn=<%=fname%>" method="post"><input class="button2" type="submit" name="share" value="share" /></form></td>
                    <td><form action="deletefile?fn=<%=fname%>" method="post"><input class="button2" type="submit" name="file" value="delete" /></form></td>
                    <td><%= remarks %></td>
                <% i++; %> 
                    
                </tr>
                
            </tbody>
            
            <%  }
                
                if( i == 0)
                {
                    
                
            %>
            
            <tbody>
                <tr>
                    
                    <td>No Files Uploaded!!!</td>
                    
                    
                </tr>
                
            </tbody>
            <% } %>
            
        </table> 
            
            <%  }catch(Exception e)
            {
                out.println("exception caught..");
                out.print(e);
            }
        %>
             </div>  
              
           
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
    

