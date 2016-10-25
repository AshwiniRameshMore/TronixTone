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

public class RemovefromCart extends HttpServlet {

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
         String sku = request.getParameter("sku");
         int items = 0;
         ArrayList<Cart> cartList = new ArrayList<Cart>();
         if(session.getAttribute("cartList") != null)
         {
           cartList = (ArrayList<Cart>) session.getAttribute("cartList");
           // Iterate over the cartList, and remove the selected product
           for(int i=0;i<cartList.size();i++)
           {
             if(cartList.get(i).getSku().equals(sku))   
               cartList.remove(i); 
           }
          }
          //Counting the no. of items on removal of product
          for(int i=0;i<cartList.size();i++)
      		 items += Integer.parseInt(cartList.get(i).getQuantity());
          
          //Check for the empty cart, and set the message
          if(cartList.size() == 0)
		 session.setAttribute("msg","Your Shopping cart is empty"); 
          else
          {
           if(session.getAttribute("msg") != null)
              session.removeAttribute("msg");
          }  
           response.getWriter().print(items);
           session.setAttribute("cartList", cartList);
        }
}

