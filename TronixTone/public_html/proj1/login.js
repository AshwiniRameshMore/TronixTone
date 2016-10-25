/*  More, Ashwini    Account: jadrn018
                     CS645, Spring 2016
                     Project #1
*/
      
$(document).ready( function() {
    var errorMsg = $('#error_msg');
    var element = new Array(2);
    element[0] = $("#user");
    element[1] = $("#password");
                  
    $("#user").focus();
    $("#user").on('blur', function() {
        if(($("#user").val()) != "") {
            $(this).removeClass("error");
            errorMsg.text("");
            }
        });
    $("#password").on('blur', function() {
        if(($("#password").val()) != "") {
            $(this).removeClass("error");
            errorMsg.text("");
            }
        });
    $(':submit').on('click', function(e) {
      if($("#user").val() == ""){
       errorMsg.text("Please enter your username!");
       element[0].focus();
       e.preventDefault();
      }
      else if($("#password").val() == ""){
       errorMsg.text("Please enter your password!");
       element[1].focus();
       e.preventDefault();
      }
      else{
       e.preventDefault();
       params = "user="+$("#user").val()+"&password="+$("#password").val();
       $.post('http://jadran.sdsu.edu/cgi-bin/jadrn018/login.cgi', params, auth_handler);       
      }  
    });
        
    $(':reset').on('click', function() {
        for(var i=0; i < 2; i++)
            element[i].removeClass("error");
        errorMsg.text("");
        element[0].focus();
        });                                       
});

function auth_handler(response) { 
    if (response === 'OK') 
        $.get("http://jadran.sdsu.edu/cgi-bin/jadrn018/home.cgi", app_handler);
    else 
        $('#error_msg').text("Incorrect username or password! Please try again!");
}

function app_handler(response) {
    $('#exterior').html(response);
}



