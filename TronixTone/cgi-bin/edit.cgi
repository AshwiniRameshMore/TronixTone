#!/usr/bin/perl 

#    More, Ashwini    Account: jadrn018
#                     CS645, Spring 2016
#                     Project #1

use CGI;
require '/srv/www/cgi-bin/jadrn018/db_connect.pl';

my $q = new CGI;
my $query = CGI->new;
my $sku = $query->param('sku');
my $category = $query->param('category');
my $vendor = $query->param('vendor');
my $mid = $query->param('MId');
my $description = $query->param('description');
my $features = $query->param('features');
my $cost = $query->param('cost');
my $retail = $query->param('retail');
my $img = $query->param('image');

print "Content-type: text/html\n\n";

my $st = "Select * from product where sku = '$sku'";
if(db_insert($st) < 1)
{
  print "FAIL";
}
else
{
  db_insert("delete from product where sku='$sku'");
  my $statement = "INSERT INTO product values(".
  "'$sku',$category,$vendor,'$mid','$description',".
  "'$features',$cost,$retail,'$img');";
  db_insert($statement);
  print "SUCCESS";
}
