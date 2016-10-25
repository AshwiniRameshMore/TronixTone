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

public class AddtoCart extends HttpServlet {

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
         String sku = request.getParameter("sku");
	 String quantity = request.getParameter("quantity");
         String option = request.getParameter("option");
         String msg = null;
         String desc = null, image = null, retail = null;
         int  onhand = 0, items = 0;
      
         Vector<String []> vector = new DBConnection3().runQuery("select product.sku, product.description, product.image, product.retail,on_hand.on_hand_quantity from product left join on_hand on product.sku=on_hand.sku where product.sku='"+ sku +"'");
                 ArrayList<Cart> cartList = new ArrayList<Cart>();
                 if (vector != null) {
                      for(int i =0; i < vector.size(); i++){
                        String[] temp = vector.elementAt(i);
                        desc = temp[1];
                        image = temp[2];
                        retail = temp[3];
                        onhand = Integer.parseInt(temp[4]);
                   }
                 }
  
         if((session.getAttribute("cartList") != null) && (option.equals("Add")))
         {
            cartList = (ArrayList<Cart>) session.getAttribute("cartList");
            int totalqty = Integer.parseInt(quantity);
            for(int i=0; i<cartList.size();i++){
              if(cartList.get(i).getSku().equals(sku))
                totalqty += Integer.parseInt(cartList.get(i).getQuantity());
            }
            quantity = Integer.toString(totalqty);
         }

        if(session.getAttribute("cartList") == null)
        {
          items = Integer.parseInt(quantity);
          cartList.add(new Cart(sku, desc, image, retail, quantity, Integer.toString(onhand), msg));
        }
        else
        {
          boolean exist = false;
          cartList = (ArrayList<Cart>) session.getAttribute("cartList");
          for(int i=0; i<cartList.size();i++){
           if(cartList.get(i).getSku().equals(sku)){
              exist = true;
              items += Integer.parseInt(quantity);
              cartList.get(i).setOnhand(Integer.toString(onhand));
              cartList.get(i).setQuantity(quantity);
              cartList.get(i).setRetail(retail);
              cartList.get(i).setDesc(desc);
              cartList.get(i).setMsg(msg); 
            }
            else{
              items += Integer.parseInt(cartList.get(i).getQuantity());           
            }
          }
          if(exist == false){
              items += Integer.parseInt(quantity);
              cartList.add(new Cart(sku, desc, image, retail, quantity, Integer.toString(onhand), msg ));
          }
        }

         if(cartList.size() == 0)
          session.setAttribute("msg","Your Shopping Cart is Empty");
         else
         {
           if(session.getAttribute("msg") != null)
              session.removeAttribute("msg");
         }
           response.getWriter().print(items);
           session.setAttribute("cartList", cartList);
        }
}

