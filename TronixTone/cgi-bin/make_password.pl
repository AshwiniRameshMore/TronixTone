#    More, Ashwini    Account: jadrn018
#                     CS645, Spring 2016
#                     Project #1

#!/usr/bin/perl

use Crypt::SaltedHash;

my @users = ('cs645','ashwini','yojana','sonal','tanisha');
my @passwords = ('sp2016','more321','patil321','jadhav321','jadhav410');
my @encrypted_passwords;
my $array_len = @users;

for($i=0; $i < $array_len; $i++) {
    my $encryption_object = Crypt::SaltedHash->new(algorithm => 'SHA-2');
    $encryption_object->add($passwords[$i]);
    push(@encrypted_passwords, $encryption_object->generate);
}

open(DATA,">passwords.dat") or die "Cannot open file";

for($i=0; $i < $array_len; $i++) {
    print DATA $users[$i]."=".$encrypted_passwords[$i]."\n";
    }

close(DATA);

