#!/usr/bin/perl -w

#create month folder
$month = `date +%b`;
$month = substr($month, 0, -1); #remove last charactor

chdir("/home/ericsson/isp");
if (-d 'log') {
 #folder exist
 #do nothing
}
else {
 #folder log does not exist
  system("mkdir log");
}


chdir("/home/ericsson/isp/log");
if (-d $month) {
 #folder exist
 chdir("/home/ericsson/isp/log/$month");
 #remove old log file
 unlink glob "*.txt";
}
else {
 #folder does not exist
  system("mkdir $month");
}

#start collecting log
#system("ls /var/opt/ericsson/sgw/outputfiles/asn1/apg_sts/ > /home/ericsson/isp/sites_axe.txt");
open (MYFILE, "/home/ericsson/isp/sites_axe.txt");
while (<MYFILE>)
{
        $NE = substr($_, 0, -1);
        print "Collecting log for $NE ...\n";
        system("/opt/ericsson/bin/cfi -N $NE -n -p -F /home/ericsson/isp/cmd.txt -d synchro > /home/ericsson/isp/log/$month/$NE.txt");
}
close (MYFILE);

