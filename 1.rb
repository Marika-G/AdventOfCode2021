# Day 1

class Depth_o_meter
    def initialize(measures_file)
        @raw_depth_measures = IO.readlines(measures_file).collect{|i| i.to_i}
        @depth_diff = calc_diff(@raw_depth_measures)
    end
    def calc_diff(measures)
        diff = []
        for i in (2...measures.length)
            diff.push(measures[i] - measures[i-1])
        end
        return diff
    end
    def get_increases
        nb = 0
        @depth_diff.each{|i| nb += 1 if i > 0}
        return nb
    end
end

meter = Depth_o_meter.new(ARGV[0])
puts meter.get_increases
