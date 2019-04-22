import os 
import functs_nava

#list of functions 
function = ['d','n', 'e', 'd', 'l']
d ={}

#Open file for editing
#prompt user for filename & store in variable:"fn"  : print, <>, chomp
filename = input ("Enter a file to open: ")
#fh = open(filename, 'r')

#if file does not exist write it 
if os.path.isfile(filename):
	fh = open (filename, 'r')
	#filename.write(input())
	#declare dictionary 
	#transfer file line by line into hash with a while loop, splitting the username and password by the delimiter character ":"
	t = fh.readlines()
	for i in range(len(t)):
		line = t[i].split(":")
		username = line[0]
		password = line[1].strip()
		d[username] = password
	fh.close()
else: 
	fh = open (filename, 'a')
	fh.close()
# outer loop until user quits
#while 1:
	#inner loop until user enters correct option
while 1:
	#print menu & prompt/chompt for user input: $choice
	print("User Accounts")
	print("-------------\n")
	print("n = New user account\n")
	print("e = Edit existing user account\n")
	print("d = Delete existing user account\n")
	print("l = List user accounts\n")
	print("q = Quit\n")
	
	var = input("Enter choice: ")
	if var in function:
		if (var == "n"):
			d = functs_nava.new_user(d)
		if var == "e":
			d = functs_nava.edit_user(d)	
		if var == "d":
			d = functs_nava.delete_user(d)
		if var == "l":
			d = functs_nava.list_accounts(d)
	elif var == "q":
		break 		
	else: 
		print ("Sorry, incorrect option")
		
saveit = input("Do you want to save? ('y' or 'n'): ")
if (saveit == 'y'):
	fh = open(filename, 'a+')
	for username, password in d.items():
		fh.write(username + ":" + password + "\n")
	
	fh.close()
	print ("IT works")



