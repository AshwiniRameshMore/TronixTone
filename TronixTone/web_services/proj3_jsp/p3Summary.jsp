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
<link rel="stylesheet" href="bootstyle.css">
</head>
<body>
<div class="showclass">
<div class="table-responsive">
<h2>Order Summary</h2>
<hr>
 <table>
 <tr>
 <td>
  <h4><u>Delivery address</u></h4>
  <div id="dname" style="font-weight:bold;">${customer.dname}</div>
  <div id="daddress">${customer.daddress}, ${customer.dlandmark},</div>
  <div id="dcity">${customer.dcity}, ${customer.dstate} - ${customer.dzip}, ${customer.dcountry}</div>
  Contact: ${customer.dphone}
</td>
<td style="padding-left:50px;">
  <h4><u>Billing address</u></h4>
  <div id="dname" style="font-weight:bold;">${customer.bname}</div>
  <div id="daddress">${customer.baddress}, ${customer.blandmark},</div>
  <div id="dcity">${customer.bcity}, ${customer.bstate} - ${customer.bzip}, ${customer.bcountry}</div>
  Contact: ${customer.bphone}
</td>
</tr>
</table>
  <hr>
  <table class="table">
  <c:set var="TotalAmt" value="${0}"/>
    <thead>
      <tr>
        <th>Products</th>
        <th></th>
        <th>Quantity</th>
        <th>Total</th>
      </tr>
    </thead>
    <tbody>

      <c:forEach items="${cartList}" var="record">
      <tr>
             <td><img name="${record.sku}" class="zoom clickable" src=/~jadrn018/proj1/images/${record.image} height=50px" width="50px" alt="Image"></td>
             <td>${record.desc}</td>
             <td>${record.quantity}</td>
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
  <td width=550px></td><td><label for="sub">Subtotal</label></td><td style="padding-left: 17px;">
  <c:set var="t" value="${TotalAmt}"/>
  <fmt:formatNumber type="currency" value="${t}"/></font>
  </td>
  </tr>
  <tr>
  <td width=500px></td><td><label for="shippingcharge">Shipping</label></td><td style="padding-left: 17px;"><fmt:formatNumber type="currency" value="${5}"/>  </td>
  </tr>
  <tr>
  <c:set var="i" value="${(TotalAmt + 5) * 0.08}"/>
  <td width=550px></td><td><label for="amt">Tax</label></td><td style="padding-left: 17px;"><fmt:formatNumber type="currency" value="${i}"/></td>
  </tr>
  <tr>
  <td></td><td><label for="amt">Amount Payable</label></td><td style="padding-left: 17px;"><font color="red" size="4">
 <c:set var="j" value="${((TotalAmt + 5) * 0.08) + 5 + TotalAmt}"/>
    <fmt:formatNumber type="currency" value="${j}"/></font>
  </td>
  </tr>
  </table>
  <br>

  </div>
<table>
<tr>
<td><button type="button" class="cancel_order">Cancel</button></td>
<td><button type="button" class="order">Place Order</button></td>
</tr>
</table>
</div>
</body>
</html>
