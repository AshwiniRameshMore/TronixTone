<!DOCTYPE html>
<html>
<!--  More, Ashwini  Account: jadrn018
                     CS645, Spring 2016
                     Project #3
-->
<head>
    <link rel="stylesheet" href="bootstyle.css">
    <link rel="stylesheet" href="bootstyle-cart.css">
</head>
<body>
 <form method="post" action="summary.jsp" name="myForm"> 
<div class="panel-group" id="accordion">
    <div class="panel panel-default">
      <div class="panel-heading">
        <h4 class="panel-title">
          <a data-toggle="collapse" data-parent="#accordion" href="#collapse1">1. ENTER EMAIL ADDRESS</a>
        </h4>
      </div>
      <div id="collapse1" class="panel-collapse collapse in">
        <div class="panel-body">
           <div class="form-group">
             <font color="red">*</font><label for="email">Email address:</label>
	     <input type="email" id="emailInput" class="form-control" required>
           </div>
        </div>
      </div>
    </div>
    <div class="panel panel-default">
      <div class="panel-heading">
        <h4 class="panel-title">
          <a data-toggle="collapse" data-parent="#accordion" href="#collapse2">2. DELIVERY ADDRESS</a>
        </h4>
      </div>
      <div id="collapse2" class="panel-collapse collapse in">
        <div class="panel-body">
           <div class="form-group">
            <table cellpadding="10">
            <tr>
             <td><font color="red">*</font><label for="name">Name:</label></td>
             <td><input type="text" id="name" required></td>
            </tr>
            <tr>
             <td><font color="red">*</font><label for="address">Address Line 1:</label></td>
             <td><input type="text" id="address" required></td>
             </tr>
            <tr>
             <td><font color="red">*</font><label for="address">Address Line 2:</label></td>
             <td><input type="text" id="landmark" required></td>
             </tr>
            <tr>
             <td><font color="red">*</font><label for="city">City:</label></td>
             <td><input type="text" id="city" required></td>
            </tr>
            <tr>
            <td><font color="red">*</font><label for="state">State:</label></td>
             <td><input type="text" id="state" required></td>
            </tr>
             <tr>
            <td><font color="red">*</font><label for="pincode">ZIP:</label></td>
             <td><input type="text" id="pin" required></td>
            </tr>
            <tr>
            <td><font color="red">*</font><label for="country">Country:</label></td>
             <td><input type="text" id="country" required></td>
            </tr>
            <tr>
             <td><font color="red">*</font><label for="phone">Phone:</label></td>
             <td><input type="tel" id="phone" Placeholder="xxx-xxx-xxxx" required></td>
            </tr></table></div>
        </div>
      </div>
    </div>
    <div class="panel panel-default">
      <div class="panel-heading">
        <h4 class="panel-title">
          <a data-toggle="collapse" data-parent="#accordion" href="#collapse22">3. BILLING ADDRESS</a>
        </h4>
      </div>
      <div id="collapse22" class="panel-collapse collapse in">
        <div class="panel-body">
             <div class="form-group">
             <div class="checkbox">
         	   <label><input type="checkbox" id="chekbox" value="">Same as Delivery address?</label>
             </div> 
            <table cellpadding="10">
            <tr>      
             <td><font color="red">*</font><label for="name">Name:</label></td>
             <td><input type="text" id="name2" name="name2" required></td>
            </tr>
            <tr>
             <td><font color="red">*</font><label for="address">Address Line 1:</label></td>
             <td><input type="text" id="address2" required></td>
             </tr>
            <tr>
             <td><font color="red">*</font><label for="address">Address Line 2:</label></td>
             <td><input type="text" id="landmark2" required></td>
             </tr>
            <tr>
             <td><font color="red">*</font><label for="city">City:</label></td>
             <td><input type="text" id="city2" required></td>
            </tr>
            <tr>
            <td><font color="red">*</font><label for="state">State:</label></td>
             <td><input type="text" id="state2" required></td>
            </tr>
            <tr>
            <td><font color="red">*</font><label for="pincode">ZIP:</label></td>
             <td><input type="text" id="pin2" required></td>
            </tr>
            <tr>
            <td><font color="red">*</font><label for="country">Country:</label></td>
             <td><input type="text" id="country2" required></td>
            </tr>
            <tr>
             <td><font color="red">*</font><label for="phone">Phone:</label></td>
             <td><input type="tel" id="phone2" Placeholder="xxx-xxx-xxxx" required></td>
            </tr></table>
            </div>
        </div>
      </div>
    </div>

   <div class="panel panel-default">
      <div class="panel-heading">
        <h4 class="panel-title">
          <a data-toggle="collapse" data-parent="#accordion" href="#collapse4">4. MAKE PAYMENT</a>
        </h4>
      </div>
      <div id="collapse4" class="panel-collapse collapse in">
        <div class="panel-body" style="text-align:center;">
          <h6 style="font-weight:bold;">Credit Card Type
          <form role="form">
             &nbsp;&nbsp;<input type="radio" name="optradio" checked>
                 <img src="http://www.credit-card-logos.com/images/visa_credit-card-logos/visa_logo_3.gif" width="35" height="22"/>
             &nbsp;&nbsp;<input type="radio" name="optradio">
                 <img src="http://www.credit-card-logos.com/images/mastercard_credit-card-logos/mastercard_logo_3.gif" width="35" height="22"/>
             &nbsp;&nbsp;<input type="radio" name="optradio">
                 <img src="http://www.credit-card-logos.com/images/discover_credit-card-logos/discover_logo_3.gif" width="35" height="22"/>
          </form>
          </h6>
             <hr>
              <div id="" style="margin-left:90px;">  
             <pre><input type="text" id="card" name="card" Placeholder="Card Number" size="33px">
             <br>Expiry Date <input type="text" id="expiry"  Placeholder="MM/YY" size="5px">     <input type="text" id="cvv"  Placeholder="CVV" size="5px">
             <br><input type="text" id="name_card"  Placeholder="Name on card" size="33px"></pre>
             </div>
       </div>
      </div>
      </div>
      </div>
    </div>
<button type="button" class="cancel">Cancel</button>
<button type="button" class="continue">Continue</button>
<br>
<label for "message" id="message"></label>
  </div> 

</form>
</body>
</html>

