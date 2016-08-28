input = '1c0111001f010100061a024b53535009181c'
fixed_string = '686974207468652062756c6c277320657965'

output = '746865206b696420646f6e277420706c6179'

input_decimal = input.to_i(16)
fixed_decimal = fixed_string.to_i(16)

xor = input_decimal ^ fixed_decimal

p xor.to_s(16)
p output
