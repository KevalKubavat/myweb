<%-- 
    Document   : logout
    Created on : 7 Nov, 2014, 8:43:32 PM
    Author     : Kubavat
--%>

<%@page import="javax.swing.JOptionPane"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
            <meta http-equiv="Pragma" content="no-cache">
            <meta http-equiv="Expires" content="-1">
            <meta http-equiv="CACHE-CONTROL" content="NO-CACHE">
        <title>logout page</title>
        
    </head>
    <body>
        <%   
            response.setHeader("Cache-Control", "no-cache"); //Forces caches to obtain a new copy of the page from the origin server   
            response.setHeader("Cache-Control", "no-store"); //Directs caches not to store the page under any circumstance   
            response.setDateHeader("Expires", 0); //Causes the proxy cache to see the page as "stale"   
            response.setHeader("Pragma", "no-cache"); //HTTP 1.0 backward compatibility  
            
            request.getSession().invalidate();
            
            JOptionPane.showMessageDialog(null, "You Are Successfully Logged Out..");
            
            response.sendRedirect("login.jsp");
  
%> 

        </form>
    </body>
</html>
