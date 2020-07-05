require 'pry'

=begin
--- Part Two ---
During the second Go / No Go poll, the Elf in charge of the Rocket Equation Double-Checker stops the launch sequence. Apparently, you forgot to include additional fuel for the fuel you just added.

Fuel itself requires fuel just like a module - take its mass, divide by three, round down, and subtract 2. However, that fuel also requires fuel, and that fuel requires fuel, and so on. Any mass that would require negative fuel should instead be treated as if it requires zero fuel; the remaining mass, if any, is instead handled by wishing really hard, which has no mass and is outside the scope of this calculation.

So, for each module mass, calculate its fuel and add it to the total. Then, treat the fuel amount you just calculated as the input mass and repeat the process, continuing until a fuel requirement is zero or negative. For example:

A module of mass 14 requires 2 fuel. This fuel requires no further fuel (2 divided by 3 and rounded down is 0, which would call for a negative fuel), so the total fuel required is still just 2.

At first, a module of mass 1969 requires 654 fuel. Then, this fuel requires 216 more fuel (654 / 3 - 2). 216 then requires 70 more fuel, which requires 21 fuel, which requires 5 fuel, which requires no further fuel. So, the total fuel required for a module of mass 1969 is 654 + 216 + 70 + 21 + 5 = 966.

The fuel required by a module of mass 100756 and its fuel is: 33583 + 11192 + 3728 + 1240 + 411 + 135 + 43 + 12 + 2 = 50346.
What is the sum of the fuel requirements for all of the modules on your spacecraft when also taking into account the mass of the added fuel? (Calculate the fuel requirements for each module separately, then add them all up at the end.)

=end

# hace el calculo general
def calculate_fuel(fuel)
  return (fuel / 3).round - 2
end

# si el valor del calculo es negativo, devuelve el mismo fuel que le llega (ejemplo 5 de fuel no necesita ajustarse)
# si el valor del calculo es positivo, devuelve de manera recursiva el fuel original + el resultado de volver a ajustar sobre ese resultado, y asi sucesivamente.
# el valor final retornado tendra en cuenta el valor fuel original + su ajuste (se puede apreciar en los outputs, comparando los arrays de fuels y adjustment)
def adjust(fuel)
  fuel_for_fuel = calculate_fuel(fuel)
  if fuel_for_fuel <= 0
    return fuel
  else
    return fuel + adjust(fuel_for_fuel)
  end
end

# file read
input = IO.readlines("data/input_part1.txt")

# primero calculo los fuels normales
fuels = []
input.each do |line|
  fuels << calculate_fuel(line.to_i)
end
p "Total fuels are: #{fuels}"

# despues su ajuste por peso
adjustment = []
fuels.each do |fuel|
  adjustment << adjust(fuel)
end
p "Total adjustments are: #{adjustment}"

# por ultimo el total es la suma de todos los adjustments
# cada adjustment esta compuesto del fuel original + su ajuste
grand_total = 0
adjustment.each {|fuel|
  grand_total += fuel
}
p "Grand total Fuel requirement is: #{grand_total}"
