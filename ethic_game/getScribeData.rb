#Team Rails - Spring 2019
#Accessing the Scribe Data Collection

require 'find'
scribe_file_paths = []
Find.find(Dir.pwd) do |path|
  scribe_file_paths << path if (path =~ /.Scribe*\.txt$/ )
end

for files in scribe_file_paths
	QuestionArray = Array.new()
	ResponseArray = Array.new()
	line_index = 0
	open(files, "r").each_line do |line|
		data		= line.split('=>')	
		#line_index	= caller.data
		#print data[0].gsub(/ +/, " "), data[1].gsub(/ +/, " ")
		QuesArray_temp = Array.new()
		RespArray_temp = Array.new()
		
		QuesArray_temp.push(data[0].strip)
		QuesArray_temp.push('0')			#Numerical Value for Reponse
		QuesArray_temp.push(line_index)

		RespArray_temp.push(data[1].strip)
		RespArray_temp.push('0')			
		RespArray_temp.push('0')
		
		QuestionArray.insert(line_index, QuesArray_temp)
		ResponseArray.insert(line_index, RespArray_temp)
		
		line_index += 1
	end
	print QuestionArray
	print ResponseArray
end
