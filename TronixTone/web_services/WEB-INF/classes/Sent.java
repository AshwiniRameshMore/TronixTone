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

public class Sent extends HttpServlet {

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
      HttpSession session = request.getSession(false);
      if(session == null) {
        ServletContext context = getServletContext();
        RequestDispatcher dispatcher
            = request.getRequestDispatcher("/WEB-INF/jsp/login_error.jsp");
        dispatcher.forward(request, response);
        }
      String sku = request.getParameter("sku");
      String date = request.getParameter("date");
      String quantity = request.getParameter("quantity");

      String result = DBConnection.insertSentInfo(sku,date,quantity);
      response.getWriter().write(result);

      }
}   
