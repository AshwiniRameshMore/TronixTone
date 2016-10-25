#!/usr/bin/perl 

#    More, Ashwini    Account: jadrn018
#                     CS645, Spring 2016
#                     Project #1

use CGI;
use CGI::Session;
use CGI::Carp qw (fatalsToBrowser);
use Crypt::SaltedHash;

##---------------------------- MAIN ---------------------------------------

authenticate_user();

sub authenticate_user {
    $q = new CGI;
    my $user = $q->param("user");
    my $password = $q->param("password");
    open DATA, "</srv/www/cgi-bin/jadrn018/passwords.dat"
        or die "Cannot open file.";
    @file_lines = <DATA>;
    close DATA;

    $OK = 0; #not authorized

    foreach $line (@file_lines) {
        chomp $line;
        ($stored_user, $stored_pass) = split /=/, $line;
        if($stored_user eq $user && Crypt::SaltedHash->validate($stored_pass, $password)) {
            $OK = 1;
            last;
            }
        }
        if($OK) {
            my $session = new CGI::Session(undef, undef, {Directory=>'/tmp'});
            $session->expires('+1d');
            my $cookie = $q->cookie(jadrn018SID => $session->id);
	    print $q->header( -cookie=>$cookie ); #send cookie with session ID to browser  
            print "OK";
            }
        else {
            print $q->header();
            print "ERROR username ".$user." password: ".$password;
            }
    }
