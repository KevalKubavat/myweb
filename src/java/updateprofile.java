

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;

/**
 *
 * @author Kubavat
 */
public class updateprofile extends HttpServlet {
    
    Connection con;
    PreparedStatement ps;

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            
            try {
                HttpSession session = request.getSession();
                int id= Integer.parseInt((String) session.getAttribute("userid"));
                String name=request.getParameter("name");
                String email =request.getParameter("email");
                String password=request.getParameter("pass");
                String dob = request.getParameter("dob");
                String gender=request.getParameter("gender");
                String monum =request.getParameter("mno");
                String loc =request.getParameter("loc");
                
                Class.forName("com.mysql.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://122.123.124.127:3306/myclouddrive","root","");
                
                
                
                
                ps = con.prepareStatement("update user set name=? , pass=? , email=? , dob=? , gender=? , mobno=? , loc=?  where id=? ");
                
                ps.setString(1, name);
                ps.setString(2, password);
                ps.setString(3, email);
                ps.setString(4, dob);
                ps.setString(5, gender);
                ps.setString(6, monum);
                ps.setString(7, loc);
                ps.setInt(8, id);
                ps.executeUpdate();
                
                //JOptionPane.showMessageDialog(null, gender);
                JOptionPane.showMessageDialog(null, "Your Account has been Updated...");
                
                ps=con.prepareStatement("select * from user where id=?");
                ps.setString(1, (String) session.getAttribute("userid") );
                
                ResultSet rs=ps.executeQuery();
                while(rs.next())
                {
                    String sname = rs.getString(2);
                    String pass = rs.getString(3);
                    session.setAttribute("name", sname);
                    session.setAttribute("pass", pass);
                }

                response.sendRedirect("ahome.jsp");
            } catch (Exception e) {
                out.println("error caught:" +e);
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
