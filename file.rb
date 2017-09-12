# require 'file'
require 'net/http'

file = File.open("0654321.0.txt")
lines = File.open("0654321.0.txt", "r"){ |datafile| 
   datafile.readlines
}
i = 0

File.open("0654321.0.txt").readlines.each do |line|
   while i < lines.length - 2
	   line = file.readline
	   puts line

uri = URI(line.to_query)
res = Net::HTTP.get_response(uri)


	   res['Set-Cookie']            # => String
res.get_fields('set-cookie') # => Array
res.to_hash['set-cookie']    # => Array
puts "Headers: #{res.to_hash.inspect}"

# Status
puts res.code       # => '200'
puts res.message    # => 'OK'
puts res.class.name # => 'HTTPOK'


	   i = i+1
   end
end
