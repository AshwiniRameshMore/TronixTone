/*  More, Ashwini    Account: jadrn018
                     CS645, Spring 2016
                     Project #2
*/
import java.io.*;
import javax.servlet.*;
import java.util.*;
import java.text.*;
import javax.servlet.http.*;
import ashwini.*;

public class Login extends HttpServlet { 
          
    public void doPost(HttpServletRequest request,
              HttpServletResponse response)
                        throws IOException, ServletException  {
        processRequest(request, response);         
        }

    public void doGet(HttpServletRequest request,
              HttpServletResponse response)
                        throws IOException, ServletException  { 
        processRequest(request, response);
        } 
        
    private void processRequest(HttpServletRequest request,
              HttpServletResponse response) 
                        throws IOException, ServletException {
        String toDo;
        if(!request.getMethod().equals("POST")) {
            response.sendRedirect("/jadrn018/jsp/login_error.jsp"); 
            return;
            }     
        String username = (String) request.getParameter("username");
        String password = (String) request.getParameter("password");
        if(username == null || password == null) {
            response.sendRedirect("/WEB-INF/jsp/login_error.jsp"); 
            return;
            }        
        if(DBConnection.isValidLogin(username,password)) {
            toDo = "/WEB-INF/jsp/home.jsp";
            HttpSession session = request.getSession(true);
            session.setAttribute("username", username);                   
            }
        else{
             toDo = "/WEB-INF/jsp/login_error.jsp";
            }
        RequestDispatcher dispatcher = request.getServletContext().getRequestDispatcher(toDo); 
        dispatcher.forward(request, response);  
        }      
}
