# Day 2

class Submarine
    def initialize
        @position_x = 0
        @position_y = 0
        @aim = 0
    end
    def get_position
        return @position_x,@position_y
    end
    def apply_instructions(instruction_file)
        resulting_shifts = read_instructions(instruction_file)
        move(resulting_shifts[0],resulting_shifts[1])
        return get_position
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
                y += value.to_i*@aim
            end
        end
        return x,y
    end
    def move(x,y)
        @position_x += x
        @position_y += y 
    end
end

my_submarine = Submarine.new()
x,y = my_submarine.apply_instructions(ARGV[0])
puts x*y
