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
	open("SampleScribe.txt", "r").each_line do |line|
		data = line.split('=>')	
		#print data[0].gsub(/ +/, " "), data[1].gsub(/ +/, " ")
		QuestionArray.push(data[0].strip)
		ResponseArray.push(data[1].strip)
	end
	print QuestionArray
	print ResponseArray
end
