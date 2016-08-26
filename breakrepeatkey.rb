string = []

File.open("repeating_key.txt", "r") do |f|
  f.each_line do |line|
    string << line.chomp
  end
  string = string.join
end

keysizes = [*2..40]


def hamming_distance(binary1, binary2)
  binary1.chars.zip(binary2.chars).map{|a,b| a.ord == b.ord ? 0 : 1}.inject(:+)
end

def select_n_bytes_package(n, string)
  [string.unpack('B*')[0][0..n-1],string.unpack('B*')[0][n..2*n]]
end


def check_key_size(keysizes, string)
  output = []
keysizes.each do |keysize|
  bytes = select_n_bytes_package(keysize, string)
  output << [keysize, hamming_distance(bytes[0], bytes[1]).to_f / keysize]
end
p output.sort_by {|k, h| h}[0]
end

def break_text_n_byte_blocks(n, string)
  string.unpack('B*').slice(3)
end

check_key_size(keysizes, string)
