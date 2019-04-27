##### Developed by Rails Team - Ethics Game (Spring 2019)
#!/usr/bin/python

import os, sys, glob, re
  

def createConversationFile(Dir, FileName, ScribeName, ScribeCon, GroupName, GroupCon):
	fopen = open(Dir + os.sep + FileName, 'w')
	
	#Writing the contents to the outputfile
	for c1, c2 in zip(ScribeCon, GroupCon):
		fopen.write(ScribeName + ' : ' + c1 + '\n')
		fopen.write(GroupName + ' : ' + c2 + '\n')

	fopen.close()


def createFileforRails(Dir, FileName, ScribeName, ScribeCon, GroupName, GroupCon):
	fopen = open(Dir + os.sep + FileName, 'w')
	
	#Writing the contents to the outputfile
	for c1, c2 in zip(ScribeCon, GroupCon):
		fopen.write(c1 + ' => ' + c2 + '\n')
	
	fopen.close()

	
def startScribe(ScribeName, VillagerName):
	print ScribeName, VillagerName
	ScribeList = []
	VillagerList = []
	
	Choice = input("Enter the number of lines")			#To be modified
	for value in range(0, Choice):	
		ScribeList.append(str(raw_input(ScribeName + ': ')))			
		VillagerList.append(str(raw_input(VillagerName + ': ')))			
	
	print ScribeList, VillagerList

	OutputRubyFile = ScribeName + '_' + VillagerName + '_Scribe.txt' 
	OutputConvFile = ScribeName + '_' + VillagerName + '_Conv.txt' 
	createFileforRails(os.getcwd(), OutputRubyFile, ScribeName, ScribeList, VillagerName, VillagerList)
	createConversationFile(os.getcwd(), OutputConvFile, ScribeName, ScribeList, VillagerName, VillagerList)


def createQandA(personid, scribeName):
		
	#LISTOFPPLnew = LISTOFPPL.copy()
	LISTOFPPL_updated = LISTOFPPL[:]
	del LISTOFPPL_updated[personid - 1]
	#print(LISTOFPPLnew)
	#print(LISTOFPPL)
	
	print("Enter the character you wish to Scribe for: ")
	for ind,val in enumerate(LISTOFPPL_updated):
		print(ind + 1, val) 
			
	Choice = input("Enter the person you wish to converse: ")
	startScribe(scribeName, LISTOFPPL_updated[Choice - 1])
		
	#while(1):
	
	#ENDStr = 'Press yes to exit : '
	#while(1):
	#	Input = input(ENDStr)
	#	print Input
	

LISTODISP = ['\nDatabase Collection for Ethics Game', 'Choose the person\n']
LISTOFPPL = ['Public_Relations_Officer', 'VGA', 'VGB', 'VGC', 'VGD']


if __name__ == '__main__':
	for val in LISTODISP:
		print(val)  

	for ind,val in enumerate(LISTOFPPL):
		print(ind + 1, val) 

	Choice = input('Enter the Scribe for the characters you wish for: ')
	createQandA(Choice, LISTOFPPL[Choice - 1])
