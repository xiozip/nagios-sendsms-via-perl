#################################################################
#		This script TeleMetron							#
#		Send SMS in GSM router GS1001					#
#		and send Email na hostt@primer.ru					#
#		Author Kardash Anton Email lagorue@gmail.com		#
#													
#################################################################
#!/usr/bin/perl
#######################
use Net::Telnet::Cisco;
# use strict;
#use warnings;
use MIME::Lite;
######################
$connect = new Net::Telnet::Cisco (Timeout => 30,
                         Prompt => '/[%#>] $/');
$connect->open('X.X.X.X');
$connect->login('admin', 'password');
##############
$date=$ARGV[0];
$time=$ARGV[1];
$hostname=$ARGV[2];
$hostaddress=$ARGV[3];
$hoststate=$ARGV[4];
#########################
#	 Block 1 			#
#########################
#
if ($connect->enable("") ) {
    @output = $connect->cmd("gsm 0 0 sms message send 8XXXXXXXXXX $date $time $hostname $hostaddress Status $hoststate ");
} else {
warn "Can't enable: " . $connect->errmsg;
}
#########################
#	Block 1			#
#########################
#
if ($connect->enable("") ) {
    @output = $connect->cmd("gsm 0 0 sms message send 8XXXXXXXXXX  $date $time $hostname $hostaddress  Status $hoststate ");
} else {
warn "Can't enable: " . $connect->errmsg;
}
#CLOSE TELNET SESSION
####################
$connect->close;
####################
# Send to Email MIME
####################
my $msg = MIME::Lite->new(
From     => 'host@mail.ru',
To       => 'host@mail.ru',
Subject  => 'Alert from TeleMetron',
Type     => 'text/plain; charset=windows-1251',
#       Encoding => 'base64',
Data     => "$date $time $hostname $hostaddress Status $hoststate",
);
$msg->send('smtp','mailo.sever.com',);
#


