key = 'ICE'
string = "Burning 'em, if you ain't quick and nimble\nI go crazy when I hear a cymbal"
padded_key = key * (string.length / key.length) + key.chars.first(string.length % key.length).join

expected = '0b3637272a2b2e63622c2e69692a23693a2a3c6324202d623d63343c2a26226324272765272a282b2f20430a652e2c652a3124333a653e2b2027630c692b20283165286326302e27282f'

def hex_to_bytes(arg)
   [arg].pack('H*')
end

def bytes_to_hex(arg)
   arg.unpack('H*').first
end

def xor_byte_strings(xor1, xor2)
  xored = xor1.chars.zip(xor2.chars).map do |c1, c2|
    (c1.ord ^ c2.ord).chr
  end
  xored.join('')
end

p bytes_to_hex(xor_byte_strings(string, padded_key)) == expected
