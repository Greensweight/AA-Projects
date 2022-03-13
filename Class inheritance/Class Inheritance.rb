
class Employee
    attr_reader :name, :title, : salary, :boss

    def initialize(name, title, salary, boss)
        @name, @title, @salary, @boss = name, title, salary, boss
    end

    def bonus(multiplier)
        bonus = (salary) * multiplier
    end
end

class Manager < Employee
    attr_reader :employees

    def initalize(name, title, salary, boss, employees)
        super(name, title, salary, boss)
        @employees = []
    end

    def bonus()
    end

end