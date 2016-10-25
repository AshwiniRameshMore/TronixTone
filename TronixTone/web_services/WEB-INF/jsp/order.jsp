<!DOCTYPE html>
<html>
<head>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
</head>
<body>

<div class="container">
  <h2>Accordion Example</h2>
  <p><strong>Note:</strong> The <strong>data-parent</strong> attribute makes sure that all collapsible elements under the specified parent will be closed when one of the collapsible item is shown.</p>
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
             <label for="email">Email address:</label>
             <input type="email" id="email" class="form-control">
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
      <div id="collapse2" class="panel-collapse collapse">
        <div class="panel-body">
             <div class="form-group">
             <label for="name">Name:</label>
             <input type="text" id="name" class="form-control"><br />
             <label for="pincode">Pincode:</label>
             <input type="text" id="pincode" class="form-control"><br />
             <label for="address">Address:</label>
             <textarea id="address" class="form-control"></textarea><br />
             <label for="landmark">Landmark:</label>
             <input type="text" id="landmark" class="form-control" Placeholder="(Optional)"><br />
             <label for="city">City:</label>
             <input type="text" id="city" class="form-control"><br />      
             <label for="state">State:</label>
             <input type="text" id="state" class="form-control"><br />
             <label for="country">Country:</label>
             <input type="text" id="country" class="form-control"><br />
             <label for="phone">Phone:</label>
             <input type="text" id="Phone" class="form-control" Placeholder="(xxx)xxx-xxxx"><br />
             </div>
        </div>
      </div>
    </div>
    <div class="panel panel-default">
      <div class="panel-heading">
        <h4 class="panel-title">
          <a data-toggle="collapse" data-parent="#accordion" href="#collapse3">3. ORDER SUMMARY</a>
        </h4>
      </div>
      <div id="collapse3" class="panel-collapse collapse">
        <div class="panel-body">
        <label for="confirmphone">Send Order Confirmation SMS alert to +1 </label>
        <input type="text" id="confirmphone" Placeholder="(xxx)xxx-xxxx"><br />
        </div>
      </div>
    </div>
    <div class="panel panel-default">
      <div class="panel-heading">
        <h4 class="panel-title">
          <a data-toggle="collapse" data-parent="#accordion" href="#collapse4">4. MAKE PAYMENT</a>
        </h4>
      </div>
      <div id="collapse4" class="panel-collapse collapse">
        <div class="panel-body">
         <!-- tabs right -->
      <div class="tabbable tabs-right">
        <ul class="nav nav-tabs">
          <li class="active"><a href="#1" data-toggle="tab">Credit Card</a></li>
          <li><a href="#2" data-toggle="tab">Debit Card</a></li>
          <li><a href="#3" data-toggle="tab">Net Banking</a></li>
        </ul>
        <div class="tab-content">
         <div class="tab-pane active" id="1">
             <br>
             <input type="text" id="card" class="form-control" Placeholder="Card Number">
             <br><input type="text" id="expiry" class="form-control" Placeholder="MM/YY">Expiry Date
             <input type="text" id="cvv" class="form-control" Placeholder="CVV">
             <br><input type="text" id="name_card" class="form-control" Placeholder="Name on card">
         </div>
         <div class="tab-pane" id="2">
         </div>
         <div class="tab-pane" id="3">
         </div>
        </div>
      </div>
      <!-- /tabs -->

        </div>
      </div>
    </div>
  </div> 
</div>
    
</body>
</html>

