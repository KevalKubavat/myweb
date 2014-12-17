/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Properties;
import java.util.Random;
import javax.mail.AuthenticationFailedException;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;

/**
 *
 * @author Kubavat
 */
public class signupverify extends HttpServlet {
    
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    boolean flag = false;
    
    public int generateRandomNumber(int start, int end )
    {
            Random random = new Random();
            long fraction = (long) ((end - start + 1 ) * random.nextDouble());
            return ((int)(fraction + start));
    }
    private class SMTPAuthenticator extends Authenticator {
 
        private PasswordAuthentication authentication;
 
        public SMTPAuthenticator(String login, String password) {
            authentication = new PasswordAuthentication(login, password);
        }
 
        protected PasswordAuthentication getPasswordAuthentication() {
            return authentication;
        }
    }
    public void sendMail(String email , long id , String name)
    {
      
        String from = "myclouddrive2@gmail.com";
        String to = email;
        String subject = "Successful Registration";
        String message = "Welcome " +name+ ". Your Registration is Successful! Your id is : " + id ;
        String login = "myclouddrive2@gmail.com";
        String password = "nathikhabar";
        
        try {
            Properties props = new Properties();
            props.setProperty("mail.host", "smtp.gmail.com");
            props.setProperty("mail.smtp.port", "587");
            props.setProperty("mail.smtp.auth", "true");
            props.setProperty("mail.smtp.starttls.enable", "true");
 
            Authenticator auth = new SMTPAuthenticator(login, password);
 
            Session session = Session.getInstance(props, auth);
 
            MimeMessage msg = new MimeMessage(session);
            msg.setText(message);
            msg.setSubject(subject);
            msg.setFrom(new InternetAddress(from));
            msg.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
            Transport.send(msg);
            JOptionPane.showMessageDialog(null, "mail is sended...");
 
        } catch (AuthenticationFailedException ex) {
            //request.setAttribute("ErrorMessage", "Authentication failed");
 
            //RequestDispatcher dispatcher = request.getRequestDispatcher(err);
            //dispatcher.forward(request, response);
            JOptionPane.showMessageDialog(null, "Authentication Failed! Try After Some time. Details :" +ex);
            return;
 
        } catch (AddressException ex) {
            //request.setAttribute("ErrorMessage", "Wrong email address");
 
            //RequestDispatcher dispatcher = request.getRequestDispatcher(err);
            //dispatcher.forward(request, response);
            JOptionPane.showMessageDialog(null, "Address Exception caught! Try After Some time. Details :" +ex);
            return;
        } catch (MessagingException ex) {
            //request.setAttribute("ErrorMessage", ex.getMessage());
 
            //RequestDispatcher dispatcher = request.getRequestDispatcher(err);
            //dispatcher.forward(request, response);
            JOptionPane.showMessageDialog(null, "Message Exception! Try After Some time. Details :" +ex);
            return;
        }
        JOptionPane.showMessageDialog(null, "Your Registration id is Sended to Your Registered Email id , Please Check Your Email.");
    }
    
    public void checkmail(String email)
    {
        try {
            
            ps = con.prepareStatement("select * from user where email=?");
            ps.setString(1, email);
            rs = ps.executeQuery();
            
            if(rs.next())
            {
                flag = true;
                JOptionPane.showMessageDialog(null, "in check mail loop");
            }
            
        } catch (Exception e) {
            out.println("exception caught while checking email!");
            JOptionPane.showMessageDialog(null, "in check mail false loop..");
        }
    }
    

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
            
            
            try {
                
            
                Integer id = generateRandomNumber(1,99999);
                String name=request.getParameter("name");
                String email =request.getParameter("email");
                String password=request.getParameter("pass");
                String dob = request.getParameter("date");
                String gender=request.getParameter("gender");
                String monum =request.getParameter("number");
                String loc =request.getParameter("loc");
                
                Class.forName("com.mysql.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://122.123.124.127:3306/myclouddrive","root","");
                
                
                checkmail(email);
                if(flag == false)
                {
                ps = con.prepareStatement("insert into user values(?,?,?,?,?,?,?,?)");
                ps.setInt(1, id);
                ps.setString(2, name);
                ps.setString(3, password);
                ps.setString(4, email);
                ps.setString(5, dob);
                ps.setString(6, gender);
                ps.setString(7, monum);
                ps.setString(8, loc);
                ps.executeUpdate();
                
                
                JOptionPane.showMessageDialog(null, "Your Account has been Created");
                sendMail(email,id,name);
                }
                else
                {
                    JOptionPane.showMessageDialog(null, "Email id Is Already taken. Please Enter another email!");
                    response.sendRedirect("newjsp.jsp");
                }
                //String message = "Your id is : " + id ;
                //JOptionPane.showMessageDialog(null, message);
                
                
                request.setAttribute("id", id);
                request.setAttribute("email", email);
                
                
                //RequestDispatcher rd = request.getRequestDispatcher("SendEmail.java");
                //rd.forward(request, response);
                response.sendRedirect("..//mypro/login.jsp");
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
