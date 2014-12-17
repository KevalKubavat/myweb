

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;


public class checkprofileServlet extends HttpServlet {
    
    Connection con;
    PreparedStatement ps;
    ResultSet rs;

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            try
            {
                HttpSession session = request.getSession();
                
                String name = (String) session.getAttribute("name");
                String pass = (String)session.getAttribute("pass");
                
                //HttpSession session1 = request.getSession(true);
                //session1.setAttribute("name1", name);
                //session1.setAttribute("pass1", pass);
                
                //JOptionPane.showMessageDialog(null, "name :" +name);
               // JOptionPane.showMessageDialog(null, "kjkjpass :" +pass);
                
                Class.forName("com.mysql.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://122.123.124.127:3306/myclouddrive","root","");
                
                //JOptionPane.showMessageDialog(null, "Connected...");
                
                ps=con.prepareStatement("select * from user where name=? and pass=?");
                ps.setString(1, name);
                ps.setString(2, pass);
                rs=ps.executeQuery();
                
                while(rs.next())
                {
                    String id = rs.getString(1);
                    String nm = rs.getString(2);
                    String pas = rs.getString(3);
                    String eml = rs.getString(4);
                    String dob = rs.getString(5);
                    String gendr = rs.getString(6);
                    String mo = rs.getString(7);
                    String loc = rs.getString(8);
                 
                    
                    
                   
                    request.setAttribute("id", id);
                    request.setAttribute("name", nm);
                    request.setAttribute("pass", pas);
                    request.setAttribute("email", eml);
                    request.setAttribute("dob", dob);
                    request.setAttribute("gendr", gendr);
                    request.setAttribute("mo", mo);
                    request.setAttribute("loc", loc);
                    
                    
                    RequestDispatcher rd=request.getRequestDispatcher("/cmyprofile.jsp");
                    rd.forward(request, response);
                    
                    
                }
                
                
                
            }catch(Exception e)
            {
                System.out.println(e);
            }
            
            
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
