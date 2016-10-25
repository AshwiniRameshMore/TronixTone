/*  More, Ashwini    Account: jadrn018
                     CS645, Spring 2016
                     Project #3
*/
$(document).ready(function() {

  $.post('http://jadran.sdsu.edu/jadrn018/servlet/Home3',loadPage);
  
       $('#cart').click(function(){
	     showCart();
       });
       $('#about').click(function(){
          $.get('proj3_jsp/p3About.jsp',aboutUs);
       });
       $('#contact').click(function(){
          $.get('proj3_jsp/p3Contact.jsp',aboutUs);
       });

       $('#home').click(function(){
          $.post('http://jadran.sdsu.edu/jadrn018/servlet/Home3',loadPage);
       });
       $("#apply").click(function(){
  
        var maxPrice = $("#max_price").val();
        if ((!$("#max_price").val() == "") && !checkFormat(maxPrice)) {
                alert("Please enter a valid price!");
                $("#max_price").val("").focus();
                status = 'error';
        }

        var minPrice = $("#min_price").val();
        if ((!$("#min_price").val() == "") && !checkFormat(minPrice)) {
                alert("Please enter a valid price!");
                $("#min_price").val("").focus();
                status = 'error';
        }
            var vendorList = "venID=";
            var categoryList = "&catID=";

             $.each($("input[name='vendor']:checked"), function(){
                vendorList += $(this).val() + ",";
            });
            vendorList += "|";
            $.each($("input[name='category']:checked"), function(){
                categoryList +=  $(this).val() + ",";
            });
            categoryList += "|";

            url = "http://jadran.sdsu.edu/jadrn018/servlet/Home3?" + vendorList + categoryList + "&min="+$('#min_price').val()+"&max="+$('#max_price').val();

            $.get(url,filterList);
        });

        $("#reset").click(function(){
            $("#min_price").val("");
            $("#max_price").val("");
	    $.post('http://jadran.sdsu.edu/jadrn018/servlet/Home3',loadPage);
	});

});

function aboutUs(response)
{
 $('#filter').hide();
 $('#content').html(response);
}
var checkFormat = function(currency) {
	var regex_currency = new RegExp("^[0-9]*(\.[0-9]{2})?$");
	return regex_currency.test(currency);
};
function processVendor(response){
  var parts = response.split("||");
  var box="";
  for(i=0;i<parts.length-1;i++)
  {
     var sub_part = parts[i].split(",");
     box += "<div class=\"checkbox\"><label for=\"vendor\"><input type =\"checkbox\" name='vendor' value='"+ sub_part[0] +"'>";
     box += sub_part[1];
     box += "</label></div>";
   }
  $('#vendor').html(box);
  $.get('http://jadran.sdsu.edu/jadrn018/servlet/Category',processCategory);
}

function processCategory(response){
  var parts = response.split("||");
  var box="";
  for(i=0;i<parts.length-1;i++)
  {
     var sub_part = parts[i].split(",");
     box += "<div class=\"checkbox\"><label for=\"category\"><input type =\"checkbox\" value='"+ sub_part[0] +"' name=\"category\">";
     box += sub_part[1];
     box += "</label></div>";
  }
  $('#category').html(box);
}

function loadPage(response){
   $.post('proj3_jsp/p3Load.jsp', showList);
}

function filterList(panel){
 $.post('proj3_jsp/p3Load.jsp', showList1);
}

function showList1(panel){
    $('#filter').show();
    $('#content').html(panel);
    $(".zoom").click(function(e) {
        e.preventDefault();
        var param = "sku=" + (this).name;
        $.post('proj3_jsp/p3Show.jsp?' + param, showInfo);
    });

    $('.add').click(function(e){
        e.preventDefault();
        var params = "sku=" + (this).name + "&quantity=1" + "&option=Add";
        $.get('http://jadran.sdsu.edu/jadrn018/servlet/AddtoCart?' + params, function(e){
            alert("Product Added to Cart");
            $('#itemcount').text(e);
        });
    });
}

function showList(panel){
    $.get('http://jadran.sdsu.edu/jadrn018/servlet/Vendor',processVendor);
    $('#filter').show();
    $('#content').html(panel);
    $(".zoom").click(function(e) {
        e.preventDefault();
        var param = "sku=" + (this).name;
        $.post('proj3_jsp/p3Show.jsp?' + param, showInfo);
    });
   
    $('.add').click(function(e){
        e.preventDefault();
        var params = "sku=" + (this).name + "&quantity=1" + "&option=Add";
        $.get('http://jadran.sdsu.edu/jadrn018/servlet/AddtoCart?' + params, function(e){
              alert("Product Added to Cart");
              $('#itemcount').text(e);
        });
    });
}

function showCart(cart){
 $('#itemcount').text(cart);
  $.post('proj3_jsp/p3Cart.jsp?', function(cart){
    $('#filter').hide();
    $('#content').html(cart);
    $('#back').click(function() {
       $.post('proj3_jsp/p3Load.jsp', showList1);
    });

    $(".qty").on("change", function() {
       var params = "sku=" + (this).name + "&quantity=" + (this).value + "&option=Modify";
       $.get('http://jadran.sdsu.edu/jadrn018/servlet/AddtoCart?' + params, showCart);
    });

    $('.remove').click(function() {
       var params = "sku=" + (this).name;
       $.get('http://jadran.sdsu.edu/jadrn018/servlet/RemovefromCart?' + params, showCart);
    });

    $('.checkout').click(function() {
       $.get('proj3_jsp/p3CustomerDetails.jsp',customerData);
    });
});
}

function customerData(response){
   $('#filter').hide();
   $('#content').html(response);
   $('#emailInput').focus();
   $('#chekbox').change(function() {
        if($(this).is(":checked")) {
           $('#name2').val($('#name').val());
           $('#pin2').val($('#pin').val());
	    $('#address2').val( $('#address').val() );
	   $('#landmark2').val($('#landmark').val());
           $('#city2').val($('#city').val());
	   $('#state2').val($('#state').val());
	   $('#country2').val($('#country').val());
           $('#phone2').val($('#phone').val());
        }else{
           $('#name2').val("");
           $('#pin2').val("");
           $('#address2').val("");
           $('#landmark2').val("");
           $('#city2').val("");
           $('#state2').val("");
           $('#country2').val("");
           $('#phone2').val("");      
        }
    });
    
    $('.continue').click(function() {
      if(isDataValid() == true){
         var params = "name=" + $('#name').val() + 
                    "&pin=" + $('#pin').val() +  
                    "&address=" + $('#address').val() +
                     "&landmark=" + $('#landmark').val() +
                     "&city=" + $('#city').val() +
                     "&state=" + $('#state').val() +
                     "&country=" + $('#country').val() +
                      "&phone=" + $('#phone').val() +
                      "&name2=" + $('#name2').val() +
                    "&pin2=" + $('#pin2').val() + 
                    "&address2=" + $('#address2').val() +
                     "&landmark2=" + $('#landmark2').val() +
                     "&city2=" + $('#city2').val() +
                     "&state2=" + $('#state2').val() +
                     "&country2=" + $('#country2').val() +
                      "&phone2=" + $('#phone2').val();

        $.post('http://jadran.sdsu.edu/jadrn018/servlet/CustomerDetails?'+params, displayCustomerData);
     }
    });
    $('.cancel').click(function() {
      $.post('proj3_jsp/p3Load.jsp', showList);
    });
}
function displayCustomerData(){
      $.post('proj3_jsp/p3Summary.jsp', placeOrder);
}
function isEmailValid(input){
 if(input.val() == "")
   {
         input.addClass("error");
         $('#message').text("Please enter email address!");
         input.focus();
         e.preventDefault();
         return false;
   }
var pattern = new RegExp(/^[+a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/i);
   if(pattern.test(input.val()) == false)
   {
         input.addClass("error");
         $('#message').text("Invalid Email address!");
         input.focus();
         e.preventDefault();
         return false;
   }

 return true;
}
function isNameValid(input){
 if(input.val() == "")
   {
         input.addClass("error");
         $('#message').text("Please enter your Name!");
         input.focus();
         e.preventDefault();
         return false;
   }
   else if(new RegExp('^([a-zA-Z]+[a-z A-Z]*)$').test(input.val()) == false)
   {
         input.addClass("error");
         $('#message').text("Invalid Name, Only characters allowed!");
         input.focus();
         e.preventDefault();
         return false;
   }

 return true;
}
function isZipValid(input){
  if(input.val() == "")
   {
         input.addClass("error");
         $('#message').text("Please enter your ZIP!");
         input.focus();
         e.preventDefault();
         return false;
   }else if(new RegExp('^([0-9]*)$').test(input.val()) == false)
   {
         input.addClass("error");
         $('#message').text("Invalid zipcode, Only digits allowed!");
         input.focus();
         e.preventDefault();
         return false;
   }
  else if(input.val().length != 5)
   {
         input.addClass("error");
         $('#message').text("Zipcode should be of 5 digits!");
         input.focus();
         e.preventDefault();
         return false;
   }

 return true;
}
function isAddressValid(input){
 if(input.val() == "")
   {
         input.addClass("error");
         $('#message').text("Please enter your Address!");
         input.focus();
         e.preventDefault();
         return false;
   }
 return true;
}
function isCityValid(input){
 if(input.val() == "")
   {
         input.addClass("error");
         $('#message').text("Please enter your City!");
         input.focus();
         e.preventDefault();
         return false;
   }
   else if(new RegExp('^([a-zA-Z]+[a-z A-Z]*)$').test(input.val()) == false)
  {
         input.addClass("error");
         $('#message').text("Invalid City, Only characters allowed!");
         input.focus();
         e.preventDefault();
         return false;
  }

 return true;
}
function isStateValid(input){
 if(input.val() == "")
   {
         input.addClass("error");
         $('#message').text("Please enter your State!");
         input.focus();
         e.preventDefault();
         return false;
   }
  else if(new RegExp('^([a-zA-Z]+[a-z A-Z]*)$').test(input.val()) == false)
 {
         input.addClass("error");
         $('#message').text("Invalid State, Only characters allowed!");
         input.focus();
         e.preventDefault();
         return false;
 }

 return true;
}
function isCountryValid(input){
 if(input.val() == "")
   {
         input.addClass("error");
         $('#message').text("Please enter your Country!");
         input.focus();
         e.preventDefault();
         return false;
   }
   else if(new RegExp('^([a-zA-Z]+[a-z A-Z]*)$').test(input.val()) == false)
   {
         input.addClass("error");
         $('#message').text("Invalid Country, Only characters allowed!");
         input.focus();
         e.preventDefault();
         return false;
   }

 return true;
}
function isPhoneValid(input){
 if(input.val() == "")
   {
         input.addClass("error");
         $('#message').text("Please enter your Phone!");
         input.focus();
         return false;
   }
 
 if(new RegExp('^[0-9]{3}-[0-9]{3}-[0-9]{4}$').test(input.val()) == false)
   {
         input.addClass("error");
         $('#message').text("Invalid Phone number!");
         input.focus();
         return false;
   }

 return true;
}
function isCardValid(input){
 if(input.val() == "")
   {
         input.addClass("error");
         $('#message').text("Please enter your 16-digit Card number!");
         input.focus();
         return false;
   }
   else if(new RegExp('^([0-9]*)$').test(input.val()) == false)
   {
         input.addClass("error");
         $('#message').text("Invalid Card, Only digits allowed!");
         input.focus();
         e.preventDefault();
         return false;
   }
   else if(input.val().length != 16)
   {
         input.addClass("error");
         $('#message').text("Card number should be of length 16-digits!");
         input.focus();
         return false;
   }

 return true;
}
function isExpiryValid(input){
 if(input.val() == "")
   {
         input.addClass("error");
         $('#message').text("Please enter Expiry Date!");
         input.focus();
         e.preventDefault();
         return false;
   }
 return true;
}
function isCvvValid(input){
 if(input.val() == "")
   {
         input.addClass("error");
         $('#message').text("Please enter CVV!");
         input.focus();
         e.preventDefault();
         return false;
   }else if(new RegExp('^([0-9]*)$').test(input.val()) == false)
   {
         input.addClass("error");
         $('#message').text("Invalid CVV, Only digits allowed!");
         input.focus();
         e.preventDefault();
         return false;
   }
  else if(input.val().length == "")
   {
         input.addClass("error");
         $('#message').text("CVV should be only 3 digits!");
         input.focus();
         e.preventDefault();
         return false;
   }
return true;
}
function isNameOnCardValid(input){
 if(input.val() == "")
 {
         input.addClass("error");
         $('#message').text("Please enter the name on card!");
         input.focus();
         e.preventDefault();
         return false;
 }
 else if(new RegExp('^([a-zA-Z]+[a-z A-Z]*)$').test(input.val()) == false)
 {
         input.addClass("error");
         $('#message').text("Invalid Name, Only characters allowed!");
         input.focus();
         e.preventDefault();
         return false;
 }

 return true;
}

function isDataValid(){
   if(isEmailValid($('#emailInput')) == false)
       return false;    
   else if(isNameValid($('#name')) == false)
       return false;
   else if(isAddressValid($('#address')) == false)
       return false;
   else if(isAddressValid($('#landmark')) == false)
       return false;
   else if(isCityValid($('#city')) == false)
       return false;
   else if(isStateValid($('#state')) == false)
       return false;
   else if(isZipValid($('#pin')) == false)
     return false;
   else if(isCountryValid($('#country')) == false)
       return false;
   else if(isPhoneValid($('#phone')) == false)
       return false;
   else if(isNameValid($('#name2')) == false)
       return false;
   else if(isAddressValid($('#address2')) == false)
       return false;
   else if(isAddressValid($('#landmark2')) == false)
       return false;
   else if(isCityValid($('#city2')) == false)
       return false;
   else if(isStateValid($('#state2')) == false)
       return false;
   else if(isZipValid($('#pin2')) == false)
       return false;
    else if(isCountryValid($('#country2')) == false)
       return false;
   else if(isPhoneValid($('#phone2')) == false)
       return false;
   else if(isCardValid($('#card')) == false)
     return false;
   else if(isExpiryValid($('#expiry')) == false)
       return false;
   else if(isCvvValid($('#cvv')) == false)
       return false;
   else if(isNameOnCardValid($('#name_card')) == false)
       return false;
  
 return true;
}
function placeOrder(response){
$('#filter').hide();
$('#content').html(response);

 $('.order').click(function() {
      $.get('http://jadran.sdsu.edu/jadrn018/servlet/Order?', confirmation);
 });
 $('.cancel_order').click(function() {
      $.post('proj3_jsp/p3Load.jsp', showList);
 });
}

function confirmation(response){
  $.post('proj3_jsp/p3Confirmation.jsp', function(response){
   $('#itemcount').text("0");
   $('#filter').hide();
   $('#content').html(response);
  });
}
function showInfo(response) {
    $('#filter').hide();
    $('#content').html(response);
    
    $('.addtoCart').click(function(e){
        e.preventDefault();
        var qtyId = "quantity" + (this).name;
        var params = "sku=" + (this).name + "&quantity=" + document.getElementById(qtyId).value + "&option=Add";
        $.get('http://jadran.sdsu.edu/jadrn018/servlet/AddtoCart?' + params, showCart);
    });
 
    $('#back').click(function() {
       $.post('proj3_jsp/p3Load.jsp', showList1);
    });
}
