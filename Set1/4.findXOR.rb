
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

def get_string_score(str)
  return -1 if str.chars.any? {|c| c.ord >= 0x80 || c.ord < 0x0a}
  str.gsub(/[^a-zA-Z0-9 ]/, '').length.to_f / str.length.to_f
end

def find_single_byte_xor(str)
  results = (0x00..0xff).map do |c|
    decoded = xor_byte_strings(str, c.chr * str.length)
    [c, decoded, get_string_score(decoded)]
  end
  results.sort_by {|c, d, s| s}.reverse[0]
end

def find_single_byte_xor_hex(hexstr)
  find_single_byte_xor(hex_to_bytes(hexstr))
end

strings = []

File.open("xor_string.txt", "r") do |f|
  f.each_line do |line|
    strings << line.chomp
  end
end

p strings.map{|x| find_single_byte_xor_hex(x)}.max_by{|c, d, s| s}
