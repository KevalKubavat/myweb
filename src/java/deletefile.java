


import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
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
public class deletefile extends HttpServlet {
   ResultSet rs=null;
   Statement st=null;
   Connection con=null;
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            
            HttpSession session = request.getSession();
            int id = Integer.parseInt((String)session.getAttribute("userid") );
            int ans = 0;
            String fname = "" ;
            //int size = (int) session.getAttribute("size");
            //JOptionPane.showMessageDialog(null, "size in del :" +size);
            //String deleteArray[];
            //deleteArray = request.getParameterValues("c");
            //for(int i = 0 ; i < size ; i++ )
            //{
        //     fname =  (String) session.getAttribute("name");
           fname =  request.getParameter("fn");
           String filepth = fname.substring(fname.lastIndexOf("\\")+1);
            //}
            //ArrayList<String> al=new ArrayList<String>(); 
            
            //JOptionPane.showMessageDialog(null, "in deletefile sevlt after dividing path : " +filepth);
            
            //String selected=""; 
            //String fname = (String) session.getAttribute("fname");
            
            
            
            
            try {
                Class.forName("com.mysql.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://122.123.124.127:3306/myclouddrive", "root" , "");
                
                st = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
                
                 rs = st.executeQuery("select * from file where id="+id);
                 
                 while(rs.next())
                 {
                     String path = rs.getString(2);
                     //JOptionPane.showMessageDialog(null,"path from db : " +path);
                     //JOptionPane.showMessageDialog(null, "before if");
                     if(path.equals(filepth))
                     {
                         //try
                         //{
                         //JOptionPane.showMessageDialog(null, "in if");
                         Statement st1 = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
                         //JOptionPane.showMessageDialog(null, "in second block filepth :" +filepth.trim());
                         ans = st1.executeUpdate("DELETE FROM file WHERE name = '"+path+"' ");
                         st1.close();
                         //JOptionPane.showMessageDialog(null, "after sql");
                         //}catch(Exception e)
                         //{
                         //  JOptionPane.showMessageDialog(null,"error caught while delete file path from db:" +e);
                         //}
                     }
                 }
                
                    JOptionPane.showMessageDialog(null, "file Deleted Successfully :" +ans);
                
                if(ans > 0)
                {
                File file = new File(fname);
                file.delete();
                }
                
                
                
              request.getRequestDispatcher("bmydrive.jsp").forward(request, response);
                               
            } catch (Exception e) {
               out.print(e);
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
