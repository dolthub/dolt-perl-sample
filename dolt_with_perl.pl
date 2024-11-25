use strict;
use warnings;
use DBI;

# Database connection details
my $dsn = "DBI:mysql:database=doltdb;host=localhost;port=3306";
my $username = "root";
my $password = "";

# Connect to the database
my $dbh = DBI->connect($dsn, $username, $password, {
    RaiseError => 1, # Automatically die on database errors
    AutoCommit => 1, # Automatically commit changes
}) or die "Could not connect to database: $DBI::errstr";

print "Connected to the database successfully.\n\n";


# Query 1: Fetch some camel data
my $select_query = qq{
    SELECT * FROM camels ORDER BY age ASC
};
my $sth_select = $dbh->prepare($select_query);
$sth_select->execute() or die "Select failed: $DBI::errstr";
print "Camels:\n";
while (my @row = $sth_select->fetchrow_array) {
    print "CamelID: $row[0], Name: $row[1], Age: $row[2], Species: $row[3], FavoriteFood: $row[4], Trivia: $row[5]\n";
}
print "\n";


# Query 2: Insert a new camel
my $insert_query = qq{
   insert into Camels values (DEFAULT, 'Topsy', 100, 'Bactrian', 'Popcorn', 'Topsy retired to LA after a career as a soldier, a builder, a miner, and a movie star.')
};
my $sth_insert = $dbh->prepare($insert_query);
$sth_insert->execute() or die "Insert failed: $DBI::errstr";
print "New camel, Topsy, added\n\n";


# Query 3: Query camel history
my $history_query = qq{
    select from_name, message from dolt_diff_camels join dolt_commits on to_commit = commit_hash where diff_type='removed'
};
my $sth_history = $dbh->prepare($history_query);
$sth_history->execute() or die "Select failed: $DBI::errstr";
print "Removed camels:\n";
while (my @row = $sth_history->fetchrow_array) {
    print "Name: $row[0], Reason: $row[1]\n";
}
print "\n";


# Clean up
$sth_select->finish();
$sth_insert->finish();
$sth_history->finish();
$dbh->disconnect();
print "Disconnected from the database.\n";
