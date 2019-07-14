#!/usr/bin/env perl
# VARIANLES #
my $devpath = "/sys/bus/hid/drivers/razerkbd/0003:1532:021E.0004";
# \VARIABLES #

use strict;

sub cord_to_code{
    return "\\x$_[0]\\x$_[1]\\x$_[1]";
}

sub set_key_to_color{
    system("echo -n -e \"$_[0]$_[1]\" > $devpath/matrix_custom_frame");
}

sub update_keyboard{
    system("echo -n \"1\" > $devpath/matrix_effect_custom");
}

my $Q = cord_to_code(2, 2);
my $A = cord_to_code(3, 2);
set_key_to_color($Q, "\\xFF\\xFF\\xFF");
set_key_to_color($A, "\\xFF\\x00\\x00");

print "Q key code: $Q\n";
update_keyboard();
