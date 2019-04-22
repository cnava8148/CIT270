#n = Create new parition
#d = delete a partitikon
#p = print the partition tble
#w = write the new partition
#q = quit without saving changes

#procedure: create a new partition
proc new_partition{ptable} {
	puts -nonewline "Enter device label "
	flush stdout
	set label [gets stdin]
#check if label already exist
if {[lsearch $ptable $label*] >=0} {
	puts "Label already exists."
	return $ptable 
}
#prompt for all other fields
set new_entry [concat $label ....]
#concat all other fields prompted for 
lappend ptable $new_entry
return $ptable
}

#procedure: delete a partition
proc delete_partition{ptable} {
}
	return $ptable
#procedure: cprint partition
proc print_table{ptable} { 

	return $ptable
}

#procedure: write a partition table to file
proc write_table{ptable} {

	return $ptable
}


#main script
#prompt for file to read
puts -nonewline "Enter filename to open: "
flush stdout
set fn [gets stdin]
#file must exist for program to run
set fh [open $fn, "r"]
#copy file contents to list
while { [gets $fh line] >0}{
		lappend ptable $line
}

#######################################33
#menu of options, "puts", "while: user choice is not "q" or "w"" , get users choice, flush stdout

#based on user input, call the appropiaite function
switch $choice{
	n {
		set ptable [new_partition{$ptable}] 
	}

	d {}
	q { puts "Exiting"}
	default { puts "Illegal option"}
#end of switch
}
#end while 
}



#make a list[array with indices and &append/replace]






"Main" procedure
#menu 
#prompt for users choice 
#call procedure
#check for quit option 
