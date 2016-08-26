#Hex to Base64
#operate on raw bites = Base64 to ASCII to Hex

require "base64"

string = '49276d206b696c6c696e6720796f757220627261696e206c696b65206120706f69736f6e6f7573206d757368726f6f6d'
output = 'SSdtIGtpbGxpbmcgeW91ciBicmFpbiBsaWtlIGEgcG9pc29ub3VzIG11c2hyb29t'

p string_to_ascii = [string].pack('H*')
p Base64.strict_encode64(string_to_ascii)
p output

#Strings
#pack/unpack -> binary string to underlying representation ('H*') - Hex; ('B*') - Binary

# Numbers
#.to_i(16)/.to_s(16) -> To/From Decimal to other Basis String
