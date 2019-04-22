package functs_nava;
use strict;


use Exporter;
use vars qw(@ISA @EXPORT);
@ISA = qw(EXPORTER);
@EXPORT = ("new_user", "edit_user", "delete_user", "list_accounts");

my $password;
my $username;
my $param;


################### new_user function ###################
# new_user function 
sub new_user{
	
	my ($param, %local_hash, $password, $username);
	$param = shift;
	%local_hash = %$param;
	
	#prompt/chomp for user name & password
	print("Enter username: ");
	$username = <>; 
	chomp($username);
	
	#strip off special chars from username: ref asmt sheet
	$username =~ s/[^a-zA-Z0-9]//g; 
	
	#convert username to lowercase: ref asmt sheet
	$username = lc($username);
	
	#check if username already exists & exit
	if (exists($local_hash{$username})) {
		print("Username already exists!") ;
		return %local_hash;
	} 
	
	#prompt user for password
	print("Enter password now: ");
	$password = <>;
	chomp($password);
	
	#strip off apostrophe from password: ref asmt sheet
	$password =~ s/\'//g;
	
	$local_hash{$username}=$password;
	return %local_hash;
}

################### edit_user ###################
sub edit_user{
	my ($param, %local_hash, $username);
	$param = shift;
	%local_hash = %$param;
	#my $key;
	
	#prompt/chomp for username
	print ("Enter username to modify: ");
	$username = <>; 
	chomp($username);
	#strip off special chars from username: ref asmt sheet
	$username =~ s/[^a-zA-Z0-9]//g; 
	#convert username to lowercase: ref asmt sheet
	$username = lc($username);
	
	#check if username DOESN'T already exists & if NOT exit
	if (!exists($local_hash{$username})){
		print("Username does not exist!");
		return %local_hash;
		
	} 
	#prompt/chomp for current password
	print("Enter current password: \n");
	$password = <>;
	chomp($password);
	#strip off apostrophe from password (ref asm sheet)
	$password =~ s/\'//g; 
	
	#check if password DOESNT already exist & if not so exit 
	if (!exists( $local_hash{$password})) {
		print("Incorrect password!");
		return my %local_hash;	
	} 
	
	#prompt/chomp for new password 
	if (exists($local_hash{$username})) {
		print ("Enter new password: \n");
		my $upadate_password = <>;
		chomp($upadate_password);
		#strip off apostrophe from password (ref asmt sheet)
		$upadate_password =~ s/\'//g;
		$local_hash{$username} = $upadate_password;
		return %local_hash;					
	}
	
}
	
	
################### delete_user ###################
sub delete_user{
	my $param = shift;
	my %local_hash = %$param;
	
	#Prompt user to delete
	print("Enter username to delete; ");
	$username=<>;
	chomp($username);
	#strip off special chars from username: ref asmt sheet
	$username =~ s/[^a-zA-Z0-9]//g; 
	$username = lc($username); 
	
	
	# delete key from bash (ref slides)
	if (exists($local_hash{$username})){
		delete($local_hash{$username});
		return %local_hash;
	}
	if (!exists($local_hash{$username})){
		print("Username does not exist!");
		return %local_hash;
		
	}
}

################### list_accounts ###################
sub list_accounts{
	$param = shift;
	my %local_hash = %$param;
	
	#print out each key & value pair from has (ref .pl file when close file)
	for my $key(keys %local_hash){
		print "$key : $local_hash{$key} \n";
	}
	return %local_hash;
}

1;