import re 

################### new_user function ###################
# new_user function 
def new_user(n):
	# n is my dictionary/local hash whatever ... 
	# you declare the variable and then you print it 
	
	#promtp for username 
	username = input("Enter username: ")
		
	#strip off special chars from username: ref asmt sheet
	username = re.sub(r'\W+','',username) 
	
	#convert username to lowercase: ref asmt sheet
	username = username.lower();
	
	#check if username already exists & exit
	if (username in n):
		print ("Username already exists!")
	else:
		password = input("Enter password: ")
		password = password.replace('\'', '')
		n[username] = password 
	return n

################### edit_user ###################
def edit_user(n):
	
	# you declare the variable and then you print it 
	username = input("Enter username: ") 
	username = re.sub(r'\W+','',username) 
	#convert username to lowercase: ref asmt sheet
	username = username.lower();
	
	#check if username DOESN'T already exists & if NOT exit
	if (username in n):
		password = input("Enter password: ")
		password = password.replace('\'', '')
		old_password = n[username]
		if (password == old_password):
			new_password = input ("Enter new password: ")
			password = password.replace('\'', '')
			n[username] = new_password
		else:
			print ("Password is incorrect!")
	else:
		print ("Username doesn't exists!")
	return n 	
################### delete_user ###################
def delete_user(n):
	# you declare the variable and then you print it 
	username = input("Enter user to delete: ") 
	username = re.sub(r'\W+','',username) 
	#convert username to lowercase: ref asmt sheet
	username = username.lower();
	if (username in n):
		del n[username]
		print ("User removed")
	else:
		print("User doesn't exist!")
	return n 
################### list_accounts ###################
def list_accounts(n):
	for username, password in n.items():
			print(username + ":" + password) 
	return n


1;