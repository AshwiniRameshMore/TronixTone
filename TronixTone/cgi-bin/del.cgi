#!/usr/bin/perl 

#    More, Ashwini    Account: jadrn018
#                     CS645, Spring 2016
#                     Project #1

use CGI;
require '/srv/www/cgi-bin/jadrn018/db_connect.pl';

my $q = new CGI;
my $query = CGI->new;
my $sku = $query->param('sku');

print "Content-type: text/html\n\n";

my $st = "Select * from product where sku = '$sku'";
if(db_insert($st) < 1)
{
   print "FAIL";
}
else
{
   db_insert("delete from product where sku='$sku'");
   print "SUCCESS";
}
