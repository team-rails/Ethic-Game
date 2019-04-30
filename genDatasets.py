##### Developed by Rails Team - Ethics Game (Spring 2019)
#!/usr/bin/python

import os, sys, glob, re
import datetime#, pytz

##### To remove all the Scribe related files in the given directory (use it in case of any memory overflow)
def removeScrbieTextfile(Dir):
	File_directory = Dir + os.sep + '*Scribe*txt'
	for files in glob.glob(File_directory):
		#print files
		os.system('rm -rf ' + files)
	
	print("All the Scribe related files are removed from \"" + str(Dir) + "\"")
	
	
##### To return the current Date and Time 
def DateTimeZone():
	utc_now = pytz.utc.localize(datetime.datetime.utcnow())
	cst_now = utc_now.astimezone(pytz.timezone("America/Matamoros"))	#CST TIME
	return str(''.join(list(cst_now.isoformat())[:19]))			#isoformat
	

##### Record all the conversation between Scribe and village groups
def createConversationFile(Dir, FileName, ScribeName, ScribeCon, GroupName, GroupCon):
	fopen = open(Dir + os.sep + FileName, 'a')
	
	#DATETIME = DateTimeZone()
	DATETIME = 'date'
	fopen.write('Conversation between ' + str(ScribeName) + ' and ' + str(GroupName) + ' at ' + str(DATETIME)  + '\n')
	
	#Writing the contents to the outputfile
	for c1, c2 in zip(ScribeCon, GroupCon):
		fopen.write(ScribeName + ' : ' + c1 + '\n')
		fopen.write(GroupName + ' : ' + c2 + '\n')

	fopen.write('\n')
	fopen.close()


##### Record the conversation between Scribe and a particular group and used further inside Rails framework
def createFileforRails(Dir, FileName, ScribeName, ScribeCon, GroupName, GroupCon):
	fopen = open(Dir + os.sep + FileName, 'a')
	
	#Writing the contents to the outputfile
	for c1, c2 in zip(ScribeCon, GroupCon):
		fopen.write(c1 + ' => ' + c2 + '\n')
	
	fopen.close()


##### Main Function : Performs the actual Scribe and Group conversation 
def startScribe(ScribeName, VillagerName):
	#print ScribeName, VillagerName
	ScribeList = []
	VillagerList = []
	
	while True:
		ScribeInput = raw_input(ScribeName + ': ')
		if (ScribeInput.lower() == 'exit'):
			break
		
		VillageInput = raw_input(VillagerName + ': ')
		if(VillageInput.lower() == 'exit'):
			break
		
		ScribeList.append(str(ScribeInput))			
		VillagerList.append(str(VillageInput))			
	
	#print ScribeList, VillagerList

	OutputRubyFile = ScribeName + '_' + VillagerName + '_Scribe.txt' 
	createFileforRails(os.getcwd(), OutputRubyFile, ScribeName, ScribeList, VillagerName, VillagerList)
	
	return ScribeList, VillagerList
	

##### To choose the Group and start the conversation
def scribeMain(personid, scribeName):
		
	#LISTOFPPLnew = LISTOFPPL.copy()
	LISTOFPPL_updated = LISTOFPPL[:]
	del LISTOFPPL_updated[personid - 1]
	#print(LISTOFPPLnew)
	#print(LISTOFPPL)
	
	while True:
		ScribeName		= scribeName
		print("Characters that the " + str(scribeName) + " can talk to: ")
		for ind,val in enumerate(LISTOFPPL_updated):
			print(ind + 1, val) 
			
		print('\n')
		Choice = input("Choose the Group from above list with whom the " + str(scribeName) + " wishes to converse. For example, if " + str(scribeName) + " wishes to converse with Cacataibo_Tribe, Press 1\nEnter any number between 1 to 4: ")

		ScribeName		= scribeName
		VillagerName	= LISTOFPPL_updated[Choice - 1] 
		print('Group Name: ' + VillagerName)
		print(EXIT_Scribe + str(VillagerName))
		print('\n')
		
		ScribeVillagerDetails = startScribe(ScribeName, VillagerName)
		
		createConversationFile(os.getcwd(), OutputConvFile, ScribeName, ScribeVillagerDetails[0], VillagerName, ScribeVillagerDetails[1])
		EXIT_Conv = '\nDoes ' + str(scribeName) + ' wish to talk to any other group? Press yes to proceed further: '
		if raw_input(EXIT_Conv).lower() == 'no':
			break
		else:
			pass
	

##### Global Strings and List used
LISTODISP = ['\n################################################################################', str(20*' ') + 'Scribe Data Collection for Ethics Game',  '################################################################################', '\nAvailable Groups to act as the Scribe for ',]
LISTOFPPL = ['Public_Relations_Officer', 'Cacataibo_Tribe', 'Murunahua_Tribe', 'Nanti_Tribe', 'Yora_Tribe']
ENDOFPROGRAM = ['\n################################################################################', str(15*' ') +'Scribe Data Collection completed!!!!!!!!!!!!!!!!!!',  '################################################################################']

EXIT_Scribe	= '\nPress exit at any instant to end the Conversation with '


OutputConvFile = 'Scribe_Tribe_Conv.txt'


##### Global MAIN: To choose the Scribe and start the data collection
if __name__ == '__main__':
	for values in LISTODISP:
		print(values)  

	for ind,val in enumerate(LISTOFPPL):
		print(ind + 1, val) 
	
	print('\n')
	
	Choice = input('Choose the Scribe from above list. For example, if Public Relations Officer wishes to act as the Scribe, Press 1\nEnter any number between 1 to 5: ')
	if Choice in range(1,6):
		ScribeName = str(LISTOFPPL[Choice - 1])
		print('Scribe for: ' + ScribeName)
		print('\n')
	
		scribeMain(Choice, ScribeName)
	
		#To remove all the existing Scribe related files
		ChoicetoRemove = raw_input('\nPress yes to remove all the Scribe related files: ')
		if str(ChoicetoRemove).lower() == 'yes':
			removeScrbieTextfile(os.getcwd())
		else:
			pass
	
		for values in ENDOFPROGRAM:
			print(values) 
			
	else:
		print("INVALID input!!!!")