

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import javax.swing.JOptionPane;

/**
 *
 * @author Kubavat
 */
@MultipartConfig(fileSizeThreshold=1024*1024*2, // 2MB
                 maxFileSize=1024*1024*10,      // 10MB
                 maxRequestSize=1024*1024*50)
public class upload extends HttpServlet {
    
     private static final String SAVE_DIR="files";

   
     protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            
            
            
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
        
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();
        String savePath = "D:" + File.separator + SAVE_DIR;
        int id = Integer.parseInt((String)session.getAttribute("userid"));
        File fileSaveDir=new File(savePath);
        if(!fileSaveDir.exists()){
             fileSaveDir.mkdir();
        }
                
        Part part=request.getPart("file");
        String fileName=extractFileName(part);
        part.write(savePath + File.separator + fileName);
           
            
        try {
                
                Class.forName("com.mysql.jdbc.Driver");
                Connection con=DriverManager.getConnection("jdbc:mysql://122.123.124.127:3306/myclouddrive","root","");
                String query="INSERT INTO file values (?, ? , ?)";
           
                PreparedStatement pst;
                pst=con.prepareStatement(query);
                
                String filePath= savePath + File.separator +fileName ;
                //String path = getServletContext().getRealPath("filePath"); 
                String filepth = filePath.substring(filePath.lastIndexOf("\\")+1);
               // JOptionPane.showMessageDialog(null, "index of file path :" +filepth);
                //String filepth = filePath.substring(n, filePath.length());
                //JOptionPane.showMessageDialog(null, "filepath in database :" +filepth);
                pst.setInt(1, id);
                pst.setString(2,filepth);
                pst.setString(3, "null");
                int i = pst.executeUpdate();
                
                out.print(i+ " records affected");
                JOptionPane.showMessageDialog(null, "File Uploaded Successfully..");
                request.getRequestDispatcher("bmydrive.jsp").forward(request, response);
                con.close();
                
                
                
                // file name of the upload file is included in content-disposition header like this:
                //form-data; name="dataFile"; filename="PHOTO.JPG"
    
            
        } catch (Exception e) {
            
            out.println(e);
        }
        //processRequest(request, response);
    }
    
    
    private String extractFileName(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        String[] items = contentDisp.split(";");
        for (String s : items) {
            if (s.trim().startsWith("filename")) {
                return s.substring(s.indexOf("=") + 2, s.length()-1);
            }
        }
        return "";
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
