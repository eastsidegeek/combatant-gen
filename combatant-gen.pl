#!/usr/bin/perl

use DBI;
use DBD::Oracle;
use Getopt::Long;

GetOptions ('user=s' => \$user,
                'pass=s' => \$pass,
                'sid=s' => \$sid,
                'count=s' => \$count
);

$conn = 'dbi:Oracle:'.$sid;

my $dbh = DBI->connect($conn,$user,$pass,{ PrintError => 1, });

my @firstnames = ('Max','Imperator','Nux','Immortan','Slit','Rictus','Toast','Splendid','Capable','Dag','Cheedo','Doof','Keeper','Iota','Corpus','Glory','Morsov','Rock','Prime','Ripsaw','Jessie','Jim','Johnny','Fifi','Mudguts','Clunk','Sarse','Benno','Grinner','Diabando','Ziggy','Lair','Starbuck','Nightrider','Silvertongue','Labatouche','Sprog','Cundalini','Grease','Charlie','Roop','Junior','Scuttle','Bubba','Midge','Wez','Zetta','Bearclaw');

my @lastnames = ('Rockatansky','Furiosa','Mohawk','Kid','Mechanic','the Fragile','Eater','Angharad','the Knowing','Erectus','Joe','Colossus','the Child','Imperator','Driver','Lookout','War Boy','Dealgood','Jr','the Pilot','Smith','with the weird hair');

$i = 0;
while ($i < $count) {
        $i++;
        $numfirst = scalar(@firstnames);
        $numlast = scalar(@lastnames);

        $first = $firstnames[(int(rand($numfirst)))];
        $last = $lastnames[(int(rand($numlast)))];
        $time = time();
        print "Adding $first $last at $time\n";


        $sql = "INSERT INTO combatants (TIMESTAMP,FIRST_NAME,LAST_NAME) VALUES ($time,'$first','$last')";
        $sth = $dbh->prepare($sql);
        $sth->execute;
        sleep(1);
} # end while
