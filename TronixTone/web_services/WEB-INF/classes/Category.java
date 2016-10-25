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

public class Category extends HttpServlet {

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
         String result="";
         Vector<String []> vector = new DBConnection3().runQuery("select * from category order by name");
                  for (int i = 0; i<vector.size(); i++)
                  {
                        String[] str = vector.elementAt(i);
                        result += str[0] + "," + str[1] + "||";
                  }
         response.getWriter().write(result);
        }
}

