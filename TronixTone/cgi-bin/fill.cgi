#!/usr/bin/perl 

#    More, Ashwini    Account: jadrn018
#                     CS645, Spring 2016
#                     Project #1

use DBI;
use CGI;

my $host = "opatija.sdsu.edu";
my $port = "3306";
my $database ="jadrn018";
my $username = "jadrn018";
my $password = "movement";
my $db_source = "dbi:mysql:$database:$host:$port";
my $response = "";

my $dbh = DBI->connect($db_source, $username, $password)
or die 'Cannot connect to db';

my $q = new CGI;
my $sku = $q->param("sku");

my $query = "select * from product where sku = '$sku';";

my $sth = $dbh->prepare($query);
$sth->execute();

$response .= '[';
while(my @row=$sth->fetchrow_array()) {
    $response .= '[ ';
    foreach $item (@row) {
        $item =~ s/\'/\\'/g;
        $response .= "'$item',";
    }
    $response = substr $response, 0, (length($response)-1);
    $response .= '],';
    }
    $response = substr $response, 0, (length($response)-1);
    $response .= ' ]';

unless($response) {
    $response = "invalid";
    }
$sth->finish();
$dbh->disconnect();

print "Content-type: text/html\n\n";
print $response;

