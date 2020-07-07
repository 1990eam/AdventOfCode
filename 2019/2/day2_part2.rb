require "pry"
# --- Part Two ---
# "Good, the new computer seems to be working correctly! Keep it nearby during this mission - you'll probably use it again. Real Intcode computers support many more features than your new one, but we'll let you know what they are as you need them."

# "However, your current priority should be to complete your gravity assist around the Moon. For this mission to succeed, we should settle on some terminology for the parts you've already built."

# Intcode programs are given as a list of integers; these values are used as the initial state for the computer's memory. When you run an Intcode program, make sure to start by initializing memory to the program's values. A position in memory is called an address (for example, the first value in memory is at "address 0").

# Opcodes (like 1, 2, or 99) mark the beginning of an instruction. The values used immediately after an opcode, if any, are called the instruction's parameters. For example, in the instruction 1,2,3,4, 1 is the opcode; 2, 3, and 4 are the parameters. The instruction 99 contains only an opcode and has no parameters.

# The address of the current instruction is called the instruction pointer; it starts at 0. After an instruction finishes, the instruction pointer increases by the number of values in the instruction; until you add more instructions to the computer, this is always 4 (1 opcode + 3 parameters) for the add and multiply instructions. (The halt instruction would increase the instruction pointer by 1, but it halts the program instead.)

# "With terminology out of the way, we're ready to proceed. To complete the gravity assist, you need to determine what pair of inputs produces the output 19690720."

# The inputs should still be provided to the program by replacing the values at addresses 1 and 2, just like before. In this program, the value placed in address 1 is called the noun, and the value placed in address 2 is called the verb. Each of the two input values will be between 0 and 99, inclusive.

# Once the program has halted, its output is available at address 0, also just like before. Each time you try a pair of inputs, make sure you first reset the computer's memory to the values in the program (your puzzle input) - in other words, don't reuse memory from a previous attempt.

# Find the input noun and verb that cause the program to produce the output 19690720. What is 100 * noun + verb? (For example, if noun=12 and verb=2, the answer would be 1202.)

# real input
# 1,0,0,3,1,1,2,3,1,3,4,3,1,5,0,3,2,1,9,19,1,19,5,23,2,23,13,27,1,10,27,31,2,31,6,35,1,5,35,39,1,39,10,43,2,9,43,47,1,47,5,51,2,51,9,55,1,13,55,59,1,13,59,63,1,6,63,67,2,13,67,71,1,10,71,75,2,13,75,79,1,5,79,83,2,83,9,87,2,87,13,91,1,91,5,95,2,9,95,99,1,99,5,103,1,2,103,107,1,10,107,0,99,2,14,0,0

def restart_memory
  input = IO.readlines("data/input.txt")
  input = input[0].split(',')
  input = input.map(&:to_i)
  return input
end

def run(input)
  target = 19690720

  # for loops anidados, van incrementando de a 1 y probando coordenadas. restarteando entre cada iteracion
  for noun in 0..100 do
    for verb in 0..100 do
      puts "noun: #{noun} verb: #{verb}"
      input = restart_memory
      puts "memory restarted"
      start = 0
      input[1] = noun
      input[2] = verb

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
          if input[0] == target
            puts "TARGET FOUND! Gravity restore coordinates are #{noun} #{verb}"
            exit
          end
          puts "reached code 99, but #{input[0]} is not desired target #{target}"
          break
        else
          puts "unrecognized opcode"
          binding.pry
          break
        end
        # a este start + 4 solo llega si es opcode 1 o 2, sino se saltea por el break
        start += 4
      end
    end
  end
end

# run computer
input = IO.readlines("data/input.txt")
input = input[0].split(',')
input = input.map(&:to_i)
run(input)
