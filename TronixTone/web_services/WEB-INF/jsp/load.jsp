<!DOCTYPE html>
<html lang="en">
<head>
  <title>TronixTone</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
  <script src="home3.js"></script>
  <style>

    /* Remove the navbar's default rounded borders and increase the bottom margin */
    .navbar {
position:fixed; margin-bottom: 50px;
     margin-top:130px;width:100%;
      background:black;
      border-radius: 0;

    }
    a{color:#4e4edb; font-weight:bold}
    /* Remove the jumbotron's default bottom margin */
     .jumbotron {
position:fixed;margin-top:0px;width:100%;

      margin-bottom: 0px; background:#4e4edb;
    }

     .container{height:100px; margin-top:-50px;}
/*  content{margin-top:750px;position:absolute;}
    /* Add a gray background color and some padding to the footer */
   footer        {padding:10px 0;
               background-color: #4e4edb;
               text-align: center;
               color: white;
               font-size:14px;}
    body{font-family:serif;}
    .head {
    font-size:50px;
    color: black;
    font-weight:bold; padding-top:20px;letter-spacing: 3px;
    }
  }
  .panel-footer{font-weight:bold;}
  .panel > .panel-heading {
    background-color: #4e4edb;
    color: white;}
.row-content{margin-top:220px}
  </style>
</head>
<body>

<!--
//   String parts = response.split("||");

//     $('.panel-footer').text(parts[5]);
-->


<div class="row">
    <div class="col-sm-3">
      <div  class="panel panel-info">
        <div class="panel-heading" id="demo"></div>
        <div class="panel-body"><img src="/~jadrn018/proj1/images/lap-001.jpg" class="img-responsive" style="width:100%" height="50px" alt="Image"></div>
        <div id="i" class="panel-footer"></div>
      </div>
    </div>
    <div class="col-sm-3">
      <div class="panel panel-info">
        <div class="panel-heading">Description</div>
        <div class="panel-body"><img src="/~jadrn018/proj1/images/tab-002.jpg" class="img-responsive" style="width:100%" height="50px" alt="Image"></div>
        <div class="panel-footer"></div>
      </div>
    </div>
    <div class="col-sm-3">
      <div class="panel panel-info">
        <div class="panel-heading">Description</div>
        <div class="panel-body"><img src="/~jadrn018/proj1/images/tab-005.jpg" class="img-responsive" style="width:100%" alt="Image"></div>
        <div class="panel-footer"></div>
      </div>
    </div>

    <div class="col-sm-3">
      <div class="panel panel-info">
        <div class="panel-heading">Description</div>
        <div class="panel-body"><img src="/~jadrn018/proj1/images/lap-005.jpg" class="img-responsive" style="width:100%" alt="Image"></div>
        <div class="panel-footer"></div>
      </div>
    </div>
  </div>


</body>
</html>


