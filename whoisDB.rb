require 'whois-parser'


# Arguments to be input by user
Domain = ARGV[0]


record = Whois.whois(Domain)
#whois all-in-one method which fetches complete data at once for given domain
parser = Whois::Parser.new(record)
# created whois-parser object which is further used for parsing whois informaition

puts parser.domain

parser.nameservers.each do |nameserver|
  puts nameserver
end