# Day 3

class Diagnosis
    def initialize
        @epsilon_rate = 0
        @gamma_rate = 0
    end
    def read_report(report_file)
        report = IO.readlines(report_file).collect{|i| i.strip.split("").collect{|j| j.to_i}}.transpose
        half = report[0].length/2
        epsilon = ""
        gamma = ""
        for b in (0...report.length)
            if report[b].sum > half
                epsilon += "1"
                gamma += "0"
            else
                epsilon += "0"
                gamma += "1"
            end
        end
        @epsilon_rate = epsilon.to_i(2)
        @gamma_rate = gamma.to_i(2)
    end
    def get_power_consumption
        return @epsilon_rate*@gamma_rate
    end
end

diagnosis = Diagnosis.new()
diagnosis.read_report(ARGV[0])
puts diagnosis.get_power_consumption