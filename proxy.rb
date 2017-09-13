require 'net/http'



uri = URI('http://whois.nic.it')
res = Net::HTTP.get_response(uri)

# Headers
res['Set-Cookie']            # => String
res.get_fields('set-cookie') # => Array
res.to_hash['set-cookie']    # => Array
puts "Headers: #{res.to_hash.inspect}"

# Status
puts res.code       # => '200'
puts res.message    # => 'OK'
puts res.class.name # => 'HTTPOK'

# Body
puts res.body


