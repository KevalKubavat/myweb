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
        <style type="text/css">
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
    <title>Admin Panel</title>  
<link rel="stylesheet" type="text/css" href="css/styles.css">
<link rel="stylesheet" type="text/css" href="css/style_1.css">
<link rel="stylesheet" media="screen" href="css/styles_1.css" >
<link rel="stylesheet"  type="text/css" href="css/tablecss.css">

    </head>
    <body>  
       
      <div class="container">  
    <header>
    <!--start logo-->
    <a href="#" id="logo"><img src="imgs/text1.jpg" width="301" height="170" alt="logo" class="rotate" title="Cloud Logo"></a>    
    
    <div class="admin" title="cloud drive welcomes you..!">Welcome Admin Your ID id:- <%=session.getAttribute("admnid")%></div>
    <form action="logout.jsp" >
        <input type="submit" name="submit" value="Logout" title="Logout" class="logoutbuton button1"/>
    </form>
	<!--end logo-->
   <!--start menu-->
   
    <nav>
    <ul>
        
        <li><a href="#"  class="current" title="Admin..place..!!!">Admin Page</a></li>
        
    </ul>
    </nav>
	<!--end menu-->
    <!--end header-->
    	
    </header> 
          <header class="headersize2">
              
               
              
              
             <div class="insidehright">
                 <br/><br/>
                 <h3 class="detofusers"> Details Of Users That are Registered... </h3>
                  
                 
                 <br/><br/>
                 
             <%
            
            
            
            try{
                
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://122.123.124.127:3306/myclouddrive" , "root" , "");
            JOptionPane.showMessageDialog(null, "connected to databse..");
       
       
            
            //int id = 234;
            
            Statement ps = con.createStatement();
            Statement ps1 = con.createStatement();
            ResultSet rs =  ps.executeQuery("select * from user");
            
        %>
                 
                 <table cellspacing='0' class="tablesize">
            <!--table header-->
            <thead>
                <tr>
                    
                    <th title="Registered user ID's.">User Id</th>
                    <th title="The Name Of the Users.">User Name</th>
                    <th title="Total Size used by the User.">Size</th>
                    <th title="Delete the User.">Delete</th>
                    
                </tr>
            </thead>
            
            <%
                int i = 0;
                float size =0;
                while(rs.next())
                {
                    int uid = rs.getInt(1);
                    String uname = rs.getString(2);
                    //JOptionPane.showMessageDialog(null, "before ps1 userid : " +uid);
                    //float size;
                    try
                    {
                        
                        ResultSet rs2 = ps1.executeQuery("select * from file where id ="+uid);
                        //JOptionPane.showMessageDialog(null, "after query.. " );
                        size = 0;
                    while(rs2.next())
                    {
                        //JOptionPane.showMessageDialog(null, "in while loop : " );
                        String filename = rs2.getString(2);
                        String fname1 = "D:\\files\\" + filename;
                        fname1.trim();
                        //JOptionPane.showMessageDialog(null, "file name  : " +fname1);
                        File file =new File(fname1);
                
                        float bytes = file.length();
                        float kilobytes = (bytes / 1024);
                        float megabytes = (kilobytes / 1024);
                        //JOptionPane.showMessageDialog(null, "size of file : " +megabytes);
                
                        size = size + megabytes ;
                    }
                        
                    }catch(Exception e)
                    {
                        out.println("Exception Caught while getting size of data : " +e);
                        
                    }
                    
                    //GetUserDataSize size = new GetUserDataSize();
                    //int dsize = (int) size.getSize(uid) ;
            %>
            <!-- ------------- -->
            <!--table body-->
            <tbody>
                <tr>
                    
                    <td><%= uid %></td>
                    <td><%= uname %></td>
                    <td><%= size %> MB</td>
                    <td><form action="deleteuser?uid=<%=uid%>" method="post"><input  class="button2"type="submit" name="delete" value="delete" /></form></td>
                    
                <% i++; %> 
                    
                </tr>
                
            </tbody>
            
            <%  }
                //session.setAttribute("size", i);
            %>
            
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
              </div> 
          </footer>
      </div>   
      
  
    </body>
</html>
    

