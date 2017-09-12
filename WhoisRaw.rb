require 'whois-parser'
require 'whois'
require 'net/ssh/proxy/socks5'


# proxy = Net::SSH::Proxy::SOCKS5.new('proxy.host', 19772,
#   :user => 'user', :password => "password")
# Net::SSH.start('host', 'user', :proxy => proxy) do |ssh|

# 	ssh.exec! "cp /some/file /another/location"
#   hostname = ssh.exec!("hostname")

#   ssh.open_channel do |ch|
#     ch.exec "sudo -p 'sudo password: ' ls" do |ch, success|
#       abort "could not execute sudo ls" unless success

#       ch.on_data do |ch, data|
#         print data
#         if data =~ /sudo password: /
#           ch.send_data("password\n")
#         end
#       end
#     end
#   end

#   ssh.loop

# end


Domain = ARGV[0]
Folder = ARGV[1]
Key = ARGV[2]

r = Whois.whois(Domain)
p = r.parser
puts p.domain

# =>  puts r.parts.count

counter = 0
whoislist = ''
executionDateTime = []
r.parts.each do|a|

parser = Whois::Parser.new(r)

executionDateTime << parser.created_on.to_s
executionDateTime << parser.updated_on.to_s
executionDateTime << parser.expires_on.to_s

# executionDateTime = "#{parser.created_on}" + "\n" + "#{parser.updated_on}" + "\n" + "#{parser.expires_on}"

# =>   puts r
# =>  puts a


whoislist = r.parts[counter].host + "\n" + whoislist + "\n" 

nomefile = '/home/nsds/Desktop/whois/' + Folder + '/' + Key + '.' + (counter + 1).to_s + '.txt'
# =>   puts nomefile 
File.write(nomefile, r.parts[counter].body)

counter = counter + 1


end

whoislist = whoislist + executionDateTime.uniq.to_s

File.write('/home/nsds/Desktop/whois/' + Folder + '/' + Key + '.0.txt', whoislist)
