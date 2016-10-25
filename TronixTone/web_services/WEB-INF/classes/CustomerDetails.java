/*  More, Ashwini    Account: jadrn018
                     CS645, Spring 2016
                     Project #3
*/
import java.io.*;
import javax.servlet.*;
import java.util.*;
import java.text.*;
import javax.servlet.http.*;
import ashwini.*;

public class CustomerDetails extends HttpServlet {

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
         HttpSession session = request.getSession(true);
         Customer customer = new Customer(request.getParameter("name"),request.getParameter("pin"),request.getParameter("address"),
                                         request.getParameter("landmark"),request.getParameter("city"),request.getParameter("state"),
                                        request.getParameter("country"),request.getParameter("phone"),
                                        request.getParameter("name2"),request.getParameter("pin2"),request.getParameter("address2"),
                                        request.getParameter("landmark2"),request.getParameter("city2"),request.getParameter("state2"),
                                        request.getParameter("country2"),request.getParameter("phone2"));

        session.setAttribute("customer",customer);
    }

}
