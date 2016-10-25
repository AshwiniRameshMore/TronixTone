<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
   "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<!--  More, Ashwini  Account: jadrn018
                     CS645, Spring 2016
                     Project #2
-->
<head>
    <title>TronixTone</title>
    <meta http-equiv="content-type" content="text/html;charset=utf-8" />
    <meta http-equiv="Pragma" content="no-cache" />
    <meta http-equiv="expires" content="0" />        
    <meta http-equiv="Content-Style-Type" content="text/css" />  
    
    <script src="/jquery/jquery.js"></script>
    <script src="/jadrn018/login.js"></script> 
    <link rel="stylesheet" type="text/css" href="/jadrn018/style.css" />
</head>

<body>
 <div class="exterior" id="exterior">
  <div class="boundary_logo">
    <div class="logo">
      <img src="/~jadrn018/proj1/images/logo.png"/>
    </div>
  </div>
  <div class="header"></div>
  <div class="login" id="login">
  <h2>Login</h2>
  <form name="login_form" method="post" action="/jadrn018/servlet/Login">
   <input type="text" id="username" name="username" size="20" placeholder="Username"/><br><br>
   <input type="password" id="password" name="password" size="20" placeholder="Password"/><br>
   <input type="reset" id="resetbtn" class="button" value="Clear"/>
   <input type="submit" id="submitbtn" class="button"  value="Log In"/>
  </form>
  </div>
<div id="error_msg">ERROR, wrong username or password</div>
 </div>
<footer>Copyright &copy; 2016. All Rights Reserved.</footer>
</body>
</html>

