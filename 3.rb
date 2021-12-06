# Day 3

class Diagnosis
    def initialize
        @epsilon_rate = 0
        @gamma_rate = 0
        @oxygen_rating = 0
        @co2_rating = 0
    end
    def read_report(report_file)
        report = parse_report(report_file)
        set_epsilon(calculate_power_consumption_param(report, "epsilon"))
        set_gamma(calculate_power_consumption_param(report, "gamma"))
        set_oxygen_rating(calculate_life_support_param(report, "oxygen"))
        set_co2_rating(calculate_life_support_param(report, "co2"))
    end
    def set_epsilon(x)
        @epsilon_rate = x
    end
    def set_gamma(x)
        @gamma_rate = x
    end
    def set_oxygen_rating(x)
        @oxygen_rating = x
    end
    def set_co2_rating(x)
        @co2_rating = x
    end
    def get_power_consumption
        return @epsilon_rate*@gamma_rate
    end
    def get_life_support_rating
        return @oxygen_rating*@co2_rating
    end
    protected
    def parse_report(file)
        return IO.readlines(file).collect{|i| i.strip.split("").collect{|j| j.to_i}}
    end
    def find_frequent(x,which)
        if which == "most"
            x.sum >= x.length/2? "1": "0"
        elsif which == "least"
            x.sum >= x.length/2? "0": "1"
        end
    end
    def calculate_power_consumption_param(report, which)
        param = which == "epsilon"? "most": "least"
        report_t = report.transpose
        rate = ""
        report_t.each{|b| rate += find_frequent(b, param)}
        return rate.to_i(2)
    end
    def calculate_life_support_param(report, which)
        param = which=="oxygen"? "most": "least"
        rep = report.clone
        i = 0
        while rep.length > 1
            freq = find_frequent(rep.transpose[i], param).to_i
            rep.delete_if{|number| number[i] != freq}
            i += 1
        end
        rating = ""
        rep[0].collect{|i| rating += i.to_s}
        return rating.to_i(2)
    end
end

diagnosis = Diagnosis.new()
diagnosis.read_report(ARGV[0])
puts diagnosis.get_power_consumption
puts diagnosis.get_life_support_rating