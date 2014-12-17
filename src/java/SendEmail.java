import java.io.*;
import static java.lang.System.out;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Properties;
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
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import javax.swing.JOptionPane;
 
@WebServlet(urlPatterns = {"/SendEmail"})
public class SendEmail extends HttpServlet {
    
    Connection con;
    ResultSet rs;
    PreparedStatement ps ;
    boolean flag = false ;
    //String  name , pass , email ;
    int id ;
    
    private class SMTPAuthenticator extends Authenticator {
 
        private PasswordAuthentication authentication;
 
        public SMTPAuthenticator(String login, String password) {
            authentication = new PasswordAuthentication(login, password);
        }
 
        protected PasswordAuthentication getPasswordAuthentication() {
            return authentication;
        }
    }
    
    public void sendMail(String email , long id , String name , String pass)
    {
      
        String from = "myclouddrive2@gmail.com";
        String to = email;
        String subject = "Password Recovery";
        String message = "Welcome " +name+ ". Your id is : " + id + " & your password is : " +pass;
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
            JOptionPane.showMessageDialog(null, " Your Unique Id & Password is Sended to Your Email. Please Check your mail.");
 
        } catch (AuthenticationFailedException ex) {
            //request.setAttribute("ErrorMessage", "Authentication failed");
 
            //RequestDispatcher dispatcher = request.getRequestDispatcher(err);
            //dispatcher.forward(request, response);
            out.println("Authentication Failed! , Try after some time..");
            JOptionPane.showMessageDialog(null, "Authentication Failed! try again. Details :" +ex);
            return;
 
        } catch (AddressException ex) {
            //request.setAttribute("ErrorMessage", "Wrong email address");
 
            //RequestDispatcher dispatcher = request.getRequestDispatcher(err);
            //dispatcher.forward(request, response);
            out.println("Address Exception");
            JOptionPane.showMessageDialog(null, "Address Exception caught! try again Details :" +ex);
            return;
        } catch (MessagingException ex) {
            //request.setAttribute("ErrorMessage", ex.getMessage());
 
            //RequestDispatcher dispatcher = request.getRequestDispatcher(err);
            //dispatcher.forward(request, response);
            out.println("Messaging Exception");
            JOptionPane.showMessageDialog(null, "Message Exception! try again Details :" +ex);
            return;
        }
        return;
    }
    
    
 
    protected void processRequest(HttpServletRequest request,
            HttpServletResponse response) throws IOException, ServletException {
 
        
        String email = (String) request.getParameter("email");
        //String id = (String) request.getAttribute("id");
        
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://122.123.124.127:3306/myclouddrive","root","");
            JOptionPane.showMessageDialog(null, "connected.. " +email);
            
            //checkmail(email); 
            try {
                
            ps = con.prepareStatement("select * from user where email=?");
            ps.setString(1, email);
            rs = ps.executeQuery();
            
            while(rs.next())
            {
                int id = rs.getInt(1);
                String name = rs.getString(2);
                String pass = rs.getString(3);
                JOptionPane.showMessageDialog(null ,"email found..");
                
                sendMail(email,id,name,pass);
                
                con.close();
                response.sendRedirect("login.jsp");
                
            }
            
                JOptionPane.showMessageDialog(null,"Email not found!");
                JOptionPane.showMessageDialog(null,"Please Enter Your Registered Email.");
                response.sendRedirect("forgotpass.jsp");
            
                
            } catch (Exception e) {
                
                out.println("exception caught while checking email!");
            }
            
            
        
                       
            
            
            
        } catch (Exception e) {
            
            out.println("Exception Caught! Details :" +e);
        }
 
        
    }
 
    
 
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }
 
}