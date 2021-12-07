# Day 1

class Depth_o_meter
    def initialize(measures_file)
        @raw_depth_measures = IO.readlines(measures_file).collect{ |i| i.to_i }
        @depth_diff = calc_diff(@raw_depth_measures)
        @depth_diff_window = calc_diff_window(@raw_depth_measures)
    end

    def calc_diff(measures)
        diff = []
        for i in (2...measures.length)
            diff.push(measures[i] - measures[i-1])
        end
        diff
    end

    def calc_diff_window(measures)
        measures_summed_window = []
        for i in (0..measures.length-3)
            measures_summed_window.push(measures[i i+3].sum)
        end
        calc_diff(measures_summed_window)
    end

    def get_increases
        calc_increases(@depth_diff)
    end

    def get_increases_window
        calc_increases(@depth_diff_window)
    end

    protected

    def calc_increases(measures)
        measures.count(&:positive?)
    end
end

meter = Depth_o_meter.new(ARGV[0])
puts meter.get_increases
puts meter.get_increases_window
