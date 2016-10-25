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

public class Order extends HttpServlet {

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
         ArrayList<Cart> cartList = new ArrayList<Cart>();
         if(session.getAttribute("cartList") != null)
         {
           cartList = (ArrayList<Cart>)session.getAttribute("cartList");
           for(int i=0;i<cartList.size();i++)
           {
               String sku = cartList.get(i).getSku();
   	       int quantity = Integer.parseInt(cartList.get(i).getQuantity());
                                      
               String res = new DBConnection3().selectQuery("SELECT on_hand_quantity from on_hand where sku ='" + sku + "'");
               int onhand = Integer.parseInt(res);
               onhand = onhand - quantity;
                                      
               java.sql.Date date = new java.sql.Date(new Date().getTime());
               SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy");

               res = new DBConnection3().updateQuery("UPDATE on_hand SET on_hand_quantity = '" + onhand + "', last_date_modified='"+sdf.format(date)+"'  WHERE sku ='" + sku + "'");
                         
         res = new DBConnection3().updateQuery("INSERT INTO merchandise_out values ('"+sku+"', '"+sdf.format(date)+"', '"+quantity+"')");
    
           }
         }
          session.removeAttribute("cartList");

        }
}

