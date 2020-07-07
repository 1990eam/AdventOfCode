require 'pry'
# --- Day 3: Crossed Wires ---
# The gravity assist was successful, and you're well on your way to the Venus refuelling station. During the rush back on Earth, the fuel management system wasn't completely installed, so that's next on the priority list.

# Opening the front panel reveals a jumble of wires. Specifically, two wires are connected to a central port and extend outward on a grid. You trace the path each wire takes as it leaves the central port, one wire per line of text (your puzzle input).

# The wires twist and turn, but the two wires occasionally cross paths. To fix the circuit, you need to find the intersection point closest to the central port. Because the wires are on a grid, use the Manhattan distance for this measurement. While the wires do technically cross right at the central port where they both start, this point does not count, nor does a wire count as crossing with itself.

# For example, if the first wire's path is R8,U5,L5,D3, then starting from the central port (o), it goes right 8, up 5, left 5, and finally down 3:

# ...........
# ...........
# ...........
# ....+----+.
# ....|....|.
# ....|....|.
# ....|....|.
# .........|.
# .o-------+.
# ...........
# Then, if the second wire's path is U7,R6,D4,L4, it goes up 7, right 6, down 4, and left 4:

# ...........
# .+-----+...
# .|.....|...
# .|..+--X-+.
# .|..|..|.|.
# .|.-X--+.|.
# .|..|....|.
# .|.......|.
# .o-------+.
# ...........
# These wires cross at two locations (marked X), but the lower-left one is closer to the central port: its distance is 3 + 3 = 6.

# Here are a few more examples:

# R75,D30,R83,U83,L12,D49,R71,U7,L72
# U62,R66,U55,R34,D71,R55,D58,R83 = distance 159
# R98,U47,R26,D63,R33,U87,L62,D20,R33,U53,R51
# U98,R91,D20,R16,D67,R40,U7,R15,U6,R7 = distance 135
# What is the Manhattan distance from the central port to the closest intersection?

# input:
=begin
["R999", "D666", "L86", "U464", "R755", "U652", "R883", "D287", "L244", "U308", "L965", "U629", "R813", "U985", "R620", "D153", "L655", "D110", "R163", "D81", "L909", "D108", "L673", "D165", "L620", "U901", "R601", "D561", "L490", "D21", "R223", "U478", "R80", "U379", "R873", "U61", "L674", "D732", "R270", "U297", "L354", "U264", "L615", "D2", "R51", "D582", "R280", "U173", "R624", "U644", "R451", "D97", "R209", "U245", "R32", "U185", "R948", "D947", "R380", "D945", "L720", "U305", "R911", "U614", "L419", "D751", "L934", "U371", "R291", "D166", "L137", "D958", "R368", "U441", "R720", "U822", "R961", "D32", "R242", "D972", "L782", "D166", "L680", "U111", "R379", "D155", "R213", "U573", "R761", "D543", "R762", "U953", "R317", "U841", "L38", "U900", "R573", "U766", "R807", "U950", "R945", "D705", "R572", "D994", "L633", "U33", "L173", "U482", "R253", "D835", "R800", "U201", "L167", "U97", "R375", "D813", "L468", "D924", "L972", "U570", "R975", "D898", "L195", "U757", "L565", "D378", "R935", "U4", "L334", "D707", "R958", "U742", "R507", "U892", "R174", "D565", "L862", "D311", "L770", "D619", "L319", "D698", "L169", "D652", "L761", "D644", "R837", "U43", "L197", "D11", "L282", "D345", "L551", "U460", "R90", "D388", "R911", "U602", "L21", "D275", "L763", "U880", "R604", "D838", "R146", "U993", "L99", "U99", "R928", "U54", "L148", "D863", "R618", "U449", "R549", "D659", "R449", "D435", "L978", "D612", "L645", "D691", "R190", "D434", "L841", "D364", "L634", "D590", "R962", "U15", "R921", "D442", "L284", "U874", "R475", "D556", "L135", "U376", "L459", "D673", "L515", "U438", "L736", "U266", "L601", "U351", "R496", "U891", "L893", "D597", "L135", "D966", "R121", "U763", "R46", "D110", "R830", "U644", "L932", "D122", "L123", "U145", "R273", "U690", "L443", "D372", "R818", "D259", "L695", "U69", "R73", "D718", "R106", "U929", "L346", "D291", "L857", "D341", "R297", "D823", "R819", "U496", "L958", "U394", "R102", "D763", "L444", "D835", "L33", "U45", "R812", "U845", "R196", "U458", "R231", "U637", "R661", "D983", "L941", "U975", "L353", "U609", "L698", "U152", "R122", "D882", "R682", "D926", "R729", "U429", "R255", "D227", "R987", "D547", "L446", "U217", "R678", "D464", "R849", "D472", "L406", "U940", "L271", "D779", "R980", "D751", "L171", "D420", "L49", "D271", "R430", "D530", "R509", "U479", "R135", "D770", "R85", "U815", "R328", "U234", "R83\n"]
=end

input = IO.readlines("data/input.txt")
input = input[0].split(",")
p input
