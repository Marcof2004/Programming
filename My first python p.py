#Using comments

#Buenas :D
'''
Buenas
Que hacen
'''

#Printing Strings

print("Hello World")
print("Python is a great interface")

#Printing a list
print('''
    [1]Try printing a list
    [2] Nice list
    [3]Sup
''')


#Declaring and printing variables
Marcofvar= 2
Pog= "ose"
print(Pog)
Pog= "es el ose"
print(Pog)
print(type(Marcofvar))
print(type(Pog))


#Using F-Strings or str
username= "Marcof2"
print(f"Hello {username}")
cycles=904
print(f"Hello {username} you have {cycles} cycles")

print("hello {}".format(username))
print("Hello {} you have {} cycles".format(username,cycles))
#separated from previous var information
print("Hello {0} you have buyed {1} bananas".format("Marcof",10))

print(username[1]) #Print the 2nd charcter in a var

print(username.upper())
print(username.lower())
print(len(username))
input("How old are you:" ) 
