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

public class Home3 extends HttpServlet {

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
         String catID = request.getParameter("catID");
         String venID = request.getParameter("venID");
         String min = request.getParameter("min");
         String max = request.getParameter("max");
         String desc = request.getParameter("desc");

         String  query = "select * from product left join on_hand on product.sku=on_hand.sku";

         if((min != null && !min.isEmpty() && max != null && !max.isEmpty()) || (catID != null && (!(catID.equals("|")))) || (venID != null && (!(venID.equals("|")))))
            query += " Where ";

///////////////////////////////////////
         if(catID != null && (!(catID.equals("|"))) && venID.equals("|"))
         {  
            String part[] = catID.split(",");
            for(int i=0;i<part.length-1;i++)
            { 
              query += "catID= " + part[i];
              if(min != null && !min.isEmpty() && max != null && !max.isEmpty())
                query += " and retail between " + min + " and " + max;
              if(i != part.length-2)
                query += " or ";
            }
                query += " order by retail ";
          }
///////////////////////////////////////
         if(catID != null && venID != null && (!(venID.equals("|"))) && (!(catID.equals("|"))))
          {
             String catPart[] = catID.split(",");
             String venPart[] = venID.split(",");

             for(int k=0;k<catPart.length-1;k++)
             { 
               for(int l=0;l<venPart.length-1;l++)   
               {
                query += " catID=" + catPart[k] + " and " + " venID= " + venPart[l];
                if(min != null && !min.isEmpty() && max != null && !max.isEmpty())
                   query += " and retail between " + min + " and " + max;
                if(l != venPart.length-2)
                  query += " or ";
                }
               if(k != catPart.length-2)
                  query += " or ";
             }
                query += " order by retail ";
          }
/////////////////////////////////////////
         if(venID != null && (!(venID.equals("|"))) && catID.equals("|"))
         {
            String part1[] = venID.split(",");
            for(int j=0;j<part1.length-1;j++)
            { 
              query += "venID= " + part1[j];
              if(min != null && !min.isEmpty() && max != null && !max.isEmpty())
                query += " and retail between " + min + " and " + max;
              if(j != part1.length-2)
                 query += " or ";
            }
                query += " order by retail ";
         }
////////////////////////////////////////
         if(min != null && !min.isEmpty() && max != null && !max.isEmpty() && catID.equals("|") && venID.equals("|"))
         {
                query += " retail between " + min + " and " + max;
                query += " order by retail ";
          } 
       
	 Vector<String []> vector = new DBConnection3().runQuery(query + ";");
	         ArrayList<Product> list = new ArrayList<Product>();
                 if (vector != null) {
           	      for(int i =0; i < vector.size(); i++){
                        String[] temp = vector.elementAt(i);
	                list.add(new Product(temp[0], temp[1], temp[2], temp[3],temp[4],temp[5], temp[6], temp[7], temp[8], temp[11]));
                   }
                 } 
               session.setAttribute("list", list);
        }
}

