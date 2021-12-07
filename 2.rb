# Day 2

class Submarine
    def initialize
        @position_x = 0
        @position_y = 0
        @aim = 0
    end
    
    def apply_instructions(instruction_file)
        x, y = read_instructions(instruction_file)
        move(x, y)
        @position_x, @position_y
    end
    
    protected
    
    def read_instructions(file)
        x = 0
        y = 0
        IO.readlines(file).each do |line|
            instruction,value = line.split(" ")
            case instruction
            when "up"
                @aim -= value.to_i
            when "down"
                @aim += value.to_i
            when "forward"
                x += value.to_i
                y += value.to_i * @aim
            end
        end
        x, y
    end
    
    def move(x, y)
        @position_x += x
        @position_y += y 
    end
end

my_submarine = Submarine.new()
x, y = my_submarine.apply_instructions(ARGV[0])
puts x*y
