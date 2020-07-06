def run(input)
  start = 0
  lap = 0
  input[1] = 12
  input[2] = 2

  while true
    opcode = input[start]
    input1 = input[start + 1]
    input2 = input[start + 2]
    output = input[start + 3]
    if opcode == 1
      input[output] = input[input1] + input[input2]
    elsif opcode == 2
      input[output] = input[input1] * input[input2]

    elsif opcode == 99
      puts "breaking"
      break
    else
      puts "CANT RECOGNIZE THAT OPCODE"
    end
  start += 4
  lap += 1
  end
  puts input
  puts "finished after #{lap} loops"
end

input = IO.readlines("data/input.txt")
input = input[0].split(',')
input = input.map(&:to_i)
run(input)
