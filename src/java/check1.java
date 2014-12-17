
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;

@WebServlet(urlPatterns = {"/check1"})
public class check1 extends HttpServlet
{
      Connection con;
      PreparedStatement ps;
      ResultSet rs;
      public void init(ServletConfig config)throws ServletException
      {
            try
               {
                        Class.forName("com.mysql.jdbc.Driver");
                        con=DriverManager.getConnection("jdbc:mysql://122.123.124.127:3306/myclouddrive","root","");
               }
                  catch (ClassNotFoundException e)
                     {
                        System.out.println(e);
                     }
                  catch (SQLException e)
                     {
                        System.out.println(e);
                     }
      }
      
      protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            
            
            /* TODO output your page here. You may use following sample code. */ 
        }
    }
      
      protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
      {
            doPost(request, response);
      }
      protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
      {
            response.setContentType("text/html");
            PrintWriter pw=response.getWriter();
            String username=request.getParameter("user");
            String password=request.getParameter("pass");
            
            
            pw.println("<html><body>");
            try
            {
                  
                  HttpSession session = request.getSession();
                  if(username.equals("1083") && password.equals("kk123"))
                  {
                      //JOptionPane.showMessageDialog(null, "in admin llop");
                      ps=con.prepareStatement("select * from admin where id=? and pass=?");
                      ps.setString(1, username);
                      ps.setString(2, password);
                      rs=ps.executeQuery();
                      if(rs.next())
                      {
                          session.setAttribute("admnid" , username);
                          session.setAttribute("adminpass" , password);
                          RequestDispatcher rd = request.getRequestDispatcher("adminpanel.jsp");
                          rd.forward(request, response);
                          
                      }
                      
                      
                      
                      
                  }
                  else
                  {
                      
                  ps=con.prepareStatement("select * from user where id=? and pass=?");
                  ps.setString(1, username);
                  ps.setString(2, password);
                  rs=ps.executeQuery();
                  
                  if(rs.next())
                  {
                      String nm = rs.getString(2);
                        
                        
                        
                        //RequestDispatcher rd1=request.getRequestDispatcher("./checkvalidate");
                        //rd1.include(request,response);
                        //or
                        //response.sendRedirect("./home.html");
                        //request.setAttribute("userid1", username);
                        //request.setAttribute("nm", nm);
                        //request.setAttribute("userps" , password);
                        session.setAttribute("userid" , username);
                        session.setAttribute("pass" , password);
                        session.setAttribute("name" , nm);
                       
                        
                        
                        RequestDispatcher rd = request.getRequestDispatcher("/ahome.jsp");
                        rd.forward(request, response);
                        pw.println("<form method=\"post\" action=\"login.jsp\">");
                        pw.println("<input type=\"submit\" name=\"logout\" " + "value=\"Logout\">");
                        pw.println("</form>");
                       
                  }
                  else
                  {
                        pw.println("<center><h3>invalid username/password Enter Correct username/password</h3></center>");
                        RequestDispatcher rd2=request.getRequestDispatcher("./login.jsp");
                        rd2.include(request,response);
                        //or
                        //response.sendRedirect("./Login.html");
                  }
                      
                  }
                  
            }
            catch (SQLException e)
                  {
                  e.printStackTrace();
                  }
      }
}