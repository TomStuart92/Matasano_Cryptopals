input = '1c0111001f010100061a024b53535009181c'
fixed_string = '686974207468652062756c6c277320657965'

output = '746865206b696420646f6e277420706c6179'

p input_decode = input.to_i(16)
p fixed_decode = fixed_string.to_i(16)

p decode = input_decode ^ fixed_decode
p decode.to_s(16)

p output
