/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

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

/**
 *
 * @author Kubavat
 */
public class share extends HttpServlet {
    
    

   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            HttpSession session = request.getSession(); 
            
            
            String username = (String) session.getAttribute("name");
            
            
            //shared user name
            int suserid = Integer.parseInt(request.getParameter("id"));
            
            //shared file name
            String sfilename = (String) session.getAttribute("sharedfilename");
            String remarks = "Shared by " + username ;
            
            //String suserid = request.getParameter("unid");
            //JOptionPane.showMessageDialog(null, "shared user name :" +suserid);
            //JOptionPane.showMessageDialog(null, "shared user file name :" +sfilename);
            
            
            
            //out.print("<h2>Select user for Sharing : </h2>");
            try {
                
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://122.123.124.127:3306/myclouddrive", "root" , "");
                PreparedStatement ps = con.prepareStatement("select * from user where id = "+suserid);
                ResultSet rs = ps.executeQuery();
                if(rs.next())
                {
                    
                    ps = con.prepareStatement("insert into file values(?,?,?)");
                    ps.setInt(1, suserid);
                    ps.setString(2, sfilename);
                    ps.setString(3, remarks);
                //out.print("<form action='share1?userid="+userid+" method='post'> ");
                //out.print(rs);
                ps.executeUpdate();
                JOptionPane.showMessageDialog(null, "File is Successfully shared");
                request.getRequestDispatcher("bmydrive.jsp").forward(request, response);
                
                    
                }else
                        {
                            JOptionPane.showMessageDialog(null, "user doesnt exists..try again..");
                            //RequestDispatcher rd = request.getRequestDispatcher("share.jsp").forward(request, response);
                            //response.sendRedirect("share.jsp");
                           
                        }
                
                
            } catch (Exception e) {
                
                out.println("error caught while Sharing : " +e);
            }
            request.getRequestDispatcher("bmydrive.jsp").forward(request, response);
            
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
