<!DOCTYPE html>
<html>
<!--  More, Ashwini  Account: jadrn018
                     CS645, Spring 2016
                     Project #3
-->
<head>
<%@ page import="java.util.*, ashwini.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <title>TronixTone</title>
    <link rel="stylesheet" href="bootstyle.css">
</head>
<body>
<%
  String sku = (String)request.getParameter("sku");
  pageContext.setAttribute("sku", sku);
%>
<div class="showclass">
<a href="#" id="back">CONTINUE SHOPPING</a>

<c:choose>
 <c:when test="${not empty msg}"><div id="msg"><h2>${msg}</h2></div></c:when>
<c:otherwise>
<div class="table-responsive">          
<h2>Your Shopping Cart</h2>
<hr>
  <table class="table">
  <c:set var="TotalAmt" value="${0}"/>
    <thead>
      <tr>
        <th>Products</th>
        <th></th>
        <th>Quantity</th>
        <th></th>
        <th>Total</th>
      </tr>
    </thead>
    <tbody>
      
      <c:forEach items="${cartList}" var="record">
      <tr>
	     <td><img name="${record.sku}" class="zoom clickable" src=/~jadrn018/proj1/images/${record.image} height=50px" width="50px" alt="Image"></td>
             <td>${record.desc}</td>
             <td>
               <select class='qty' name="${record.sku}" value="${record.quantity}">
                <c:forEach begin='1' end='${record.onhand}' var='cnt'>
                   <c:choose>
                      <c:when test="${record.quantity == cnt}">
                       <option selected="selected" value="${cnt}">${cnt}</option>
                      </c:when>
                      <c:otherwise>
                       <option value="${cnt}">${cnt}</option>
                      </c:otherwise>
                   </c:choose>
                </c:forEach>
                </select>
             </td>
             <td>
              <button class="btn remove" name="${record.sku}" type="button"><font color="#4e4edb"><span class="glyphicon glyphicon-remove">REMOVE</span></font></button></td>
             <td>  
               <c:set var="ItemAmt" value="${record.retail * record.quantity}"/>
               <fmt:formatNumber type="currency" value="${ItemAmt}"/>
               <c:set var="TotalAmt" value="${TotalAmt + ItemAmt}"/>
             </td>
      </tr>     
      </c:forEach>
    </tbody>
  </table>
  <hr>
  <table>
  <tr>
  <td style="padding-left: 610px;"></td><td><label for="sub">Total:</label></td><td style="padding-left: 17px;">
  <c:set var="t" value="${TotalAmt}"/>
  <fmt:formatNumber type="currency" value="${t}"/></font>
  </td>
  </tr>
  </table>
  <br><br>

  <button class='checkout' type='button' name=${record.sku} width="1000px">Check Out Now</button>
  </div>
</c:otherwise>
</c:choose>
</div>    
</body>
</html>

