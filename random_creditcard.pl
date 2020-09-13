#!/usr/bin/perl

use strict;
my $DEBUG=0;
my $number;
my @prefix = qw(51 52 53 54 55 41 40);

my $i;
my $weight;
my $sum;

srand;
$i = @prefix;
print "\$i=$i\n" if $DEBUG;
$i = int(rand($i));
print "\$i=$i\n" if $DEBUG;
$number = @prefix[$i];
print "\$number = $number\n" if $DEBUG;

$number .=  sprintf("%d", int(rand(10)))
   until (length($number)>= 15);

for ($i = 0; $i < length($number); $i++) {
	$weight = substr($number, -1 * ($i + 1), 1) * (2 - ($i % 2));
	$sum += (($weight < 10) ? $weight : ($weight - 9));
    }

$number .= (10-$sum % 10) % 10;

print sprintf("%s %03d\n", $number, int(rand(1000)));
