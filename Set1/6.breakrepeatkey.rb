require 'base64'

string = []
File.open("6a.repeating_key.txt", "r") do |f|
  f.each_line do |line|
    string << line.chomp
  end
end

keysizes = [*2..40]
binary_string = Base64.strict_decode64(string.join).unpack('B*')[0]

def hamming_distance(binary1, binary2)
  binary1.chars.zip(binary2.chars).map{|a,b| a.ord == b.ord ? 0 : 1}.inject(:+)
end

def test_hamming_distance
  hamming_distance('wokka wokka!!!'.unpack('B*')[0], 'this is a test'.unpack('B*')[0]) == 37
end

def select_bytes_package(n, binary_string)
  x = binary_string.scan(/......../)
  [x[0..n-1].join, x[n..2*n].join]
end

def check_key_size(keysizes, string)
  output = []
  keysizes.each do |keysize|
    bytes = select_bytes_package(keysize, string)
    output << [keysize, (hamming_distance(bytes[0],bytes[1])).to_f / keysize]
  end

 output.sort_by {|k, h| h}
end

p check_key_size(keysizes, binary_string)

#[[40, 0.15], [24, 0.25], [10, 0.3], [16, 0.3125]]
