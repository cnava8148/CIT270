use strict;
use functs_nava;
my %function = ('n' =>\&new_user, 'e' =>\&edit_user, 'd' =>\&delete_user, 'l' =>\&list_accounts);

#global var's 
my $fn;
my %hash; 
my $choice; 
my $line;
my @line_array;
my %hash_local;


#Open file for editing
#prompt user for filename & store in variable:"fn"  : print, <>, chomp

print("Enter file to open: ");
$fn = <>;
chomp($fn);
open(my $fh, "<", $fn);

#if file does not exist, create it
if (!$fh) {
	open (my $fh, ">", $fn); 
}

#transfer file line by line into hash
while ($line=<$fh>) {
	@line_array=split(/:/, $line);
	my $username = $line_array[0];
	my $password = $line_array[1];
	chomp($password);
	$hash{$username} = $password;
}

# outer loop until user quits
outer_loop: while(1){
	
	#nested loop until the user enters a correct option
	inner_loop: while(1){
		#print menu & prompt/chompt for user input: $choice
		print("\nUser Accounts\n");
		print("\n-------------\n");
		print("n = New User Account\n");
		print("e = Edit Existing User Account\n");
		print("d = Delete Existing User Account\n");
		print("l = List User Accounts\n");
		print("q = Quit\n");
		
		print ("\nEnter a choice: ");
		$choice =<>;
		chomp($choice);
		
		
		
		if($choice eq 'q'){
			last outer_loop;
		}
		
		if (exists($function{$choice})) {
			last inner_loop;
		} else {print ("Unknown choice!\n");
		}
		my $selection = $function{$choice};
		%hash = $selection -> (\%hash);
		}
	#end of outer loop 
}		


#Close the file for writing
close($fh);

#Ask user to save changes
print("Save Contents?(y/n): \n");
my $saveit=<>;
chomp($saveit);
# prompt user to save changes: $saveit
	if ($saveit eq 'y') {
		open ($fh, ">", $fn);
		for my $key (keys %hash){
			print $fh $key . ":" . $hash{$key} . "\n";
		}
		close($fh);
	}


