require 'base64'

string = []

File.open("repeating_key.txt", "r") do |f|
  f.each_line do |line|
    string << line.chomp
  end
  string = Base64.strict_decode64(string.join)
end

keysizes = [*2..40]


def hamming_distance(binary1, binary2)
  binary1.chars.zip(binary2.chars).map{|a,b| a.ord == b.ord ? 0 : 1}.inject(:+)
end

def select_n_bytes_package(n, string)
  string.unpack('B*')[0].scan(/.{#{n}}/)
end

def check_key_size(keysizes, string)
  output = []
  keysizes.each do |keysize|
    bytes = select_n_bytes_package(keysize, string)
    output << [keysize, hamming_distance(bytes[0], bytes[1]).to_f / keysize]
  end
 output.sort_by {|k, h| h}[0..3]
end

#[[40, 0.15], [24, 0.25], [10, 0.3], [16, 0.3125]]
