<!DOCTYPE html>
<html>
<!--  More, Ashwini  Account: jadrn018
                     CS645, Spring 2016
                     Project #3
-->
<head>
<%@ page import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
    <title>TronixTone</title>
    <link rel="stylesheet" href="bootstyle.css">
</head>
<body>
<%
  String sku = (String)request.getParameter("sku");
  pageContext.setAttribute("sku", sku);
%>
<div class="showclass">
<c:forEach items="${list}" var="record">
    <c:if test="${record['sku'] == sku}">
        <div id="back"><a href="#">&lt;&lt;Back to Product List</a></div>
        <table>
        <tr>
        <td><img width = 300px height=200px src=/~jadrn018/proj1/images/${record.image} /></td>
        <td width=20px></td>
        <td>
        <br><font size="4"><strong>${record.description}</strong></font><br /><br />
             <label for='price'>Price: </label><font color="red" size="4"><strong>$ ${record.retail}</strong></font><br>
              <c:if test="${record.quantity < 1}">
                <font color="maroon" size="3"><strong>Not in Stock</strong></font><br>
              </c:if>
              <c:if test="${record.quantity == null}">
                <font color="maroon" size="3"><strong>Not in Stock</strong></font><br>
              </c:if>

             <c:set var="string1" value="${record.features}"/>
       <c:set var="string2" value="${fn:replace(string1, ',', '<br /></li><li>')}" />
       <br><label for='features'>Features:</label><br><div style="margin-left:10px;"><li>${string2}</div>

              <c:if test="${record.quantity > 0}">
               <%-- set  onhand - cartQty --%>  
                 <c:set var="remnant" value="${record.quantity}"/>
                 <c:forEach var="cartItem" items="${cartList}">
                   <c:if test="${cartItem.sku eq record.sku}">
                    <c:set var="remnant" value="${record.quantity - cartItem.quantity}" />
                   </c:if>
                 </c:forEach><br>
               
                <c:choose>
                <c:when test="${remnant > 0}">      
                <label for='Quantity'>Select Quantity:</label>
                <select id="quantity${record.sku}">
                  <c:forEach begin='1' end='${remnant}' var='cnt'>
                   <option value="${cnt}">${cnt}</option>
                  </c:forEach>
                </select>
                <br><br>
                <button class='addtoCart' type='button' name=${record.sku}>Add to Cart</button>
                </c:when>
                <c:otherwise>
                  <font color="maroon" size="3"><strong>Sorry - Product is no longer available</strong></font>
                </c:otherwise>
                </c:choose>
              
             </c:if>   
        </td>
       </tr>
       </table>
     </c:if>
</c:forEach>
</div>
<div  style="height:100px;"></div>
</body>
</html>
