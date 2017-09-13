# require 'file'


require 'mysql'  
require 'whois-parser'
require 'socket'
require 'socksify/http'



file = File.open("0654321.0.txt")
lines = File.open("0654321.0.txt", "r"){ |datafile| 
   datafile.readlines
}
i = 0

puts lines

while i < lines.length - 3

	line = file.readline
		puts line

		if line!='\0'

			line[0..5] = ""
			line[line.length-1] = ""
			url = line
		   #url = line
		   #puts url
		    #uri = URI.parse(URI.encode(url))
			#uri = URI.parse("https://www."+line)
			#puts uri
			#url1 = URI(uri)
			

			r= Whois.whois(url)
			#p=r.parser
			puts r





			#res = Net::HTTP.get_response(uri)


		  # res['Set-Cookie']            # => String
	#res.get_fields('set-cookie') # => Array
	#res.to_hash['set-cookie']    # => Array

	# Status
	#puts res.code       # => '200'
	#puts res.message    # => 'OK'
	#
	end

	
		# url = line
		# puts url
		# ip = IPSocket::getaddress(url)
		# puts ip

	i = i+1

end

# File.open("0654321.0.txt").readlines.each do |line|
# 	while i < lines.length - 3

# 		#line[0..5] = ""


# end
# end


  
#my = Mysql.new(hostname, username, password, databasename)  
con = Mysql.new('localhost', 'root', '123456', 'whois')  
rs = con.query('select * from proxies')  
rs.each_hash { |h| puts h['IP']}  
con.close  

uri = URI.parse('http://rubyforge.org/')
Net::HTTP.SOCKSProxy('127.0.0.1', 9050).start(uri.host, uri.port) do |http|
  http.get(uri.path)
end