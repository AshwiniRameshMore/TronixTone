<!DOCTYPE html>
<html lang="en">
<!--  More, Ashwini  Account: jadrn018
                     CS645, Spring 2016
                     Project #3
-->
<head>
  <title>TronixTone</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
  <link rel="stylesheet" href="bootstyle.css">
   <script src="/~jadrn018/proj1/jquery/jquery.js"></script>
  <script src="/~jadrn018/proj1/jquery/jqueryUI.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
  <%@ page import="java.util.*, ashwini.*" %>
</head>

<body>
<div class="col-sm-9">
<c:if test="${empty list}">
<h4><div id="sorry">Sorry - Your search did not match any products. Please try again.</div></h4>
</c:if>

    <c:forEach items="${list}" var="record">
            <div class="col-sm-3">
            <div class="panel panel-info">
                 <div class="panel-heading">
                     <img name="${record.sku}" class="zoom clickable" src=/~jadrn018/proj1/images/${record.image} height="100px" width="150px" alt="Image"></div>
                 <div class="panel-body">${record.vendorModel}</div>
                 <div class="panel-footer">
                 <c:choose>
                    <c:when test="${record.quantity > 0}"><font color="green">In Stock</font><br>$${record.retail}&nbsp;&nbsp;&nbsp;<button class="btn btn-default add" type="button" name="${record.sku}" value="${record.quantity}">
                         <font color="black"><span class="glyphicon glyphicon-shopping-cart">Buy</span></font>
                       </button>
                    </c:when>
                    <c:when test="${record.quantity == 0}">
                        <font color="hotpink">More on the way</font><br><div id="spc" style="padding-top:7px;padding-bottom:7px">$${record.retail}</div>
                    </c:when>
                    <c:otherwise><font color="red">Coming Soon</font><br><div id="spc" style="padding-top:7px;padding-bottom:7px">$${record.retail}</div>

                    </c:otherwise>
                 </c:choose>
                 </div>
             </div>
             </div> 
        </c:forEach>
</div>
 </body>
</html>

