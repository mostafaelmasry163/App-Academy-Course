require "employee"

class Startup
    attr_reader :name, :funding, :salaries, :employees

    def initialize (name, funding, salaries)
        @name = name
        @funding = funding
        @salaries = salaries
        @employees = []
    end

    def valid_title?(title)
        salaries.has_key?(title)
    end

    def >(create_startup)
        funding > create_startup.funding
    end

    def hire(employee_name, title)
        if self.valid_title?(title)
            employees << Employee.new(employee_name, title)
        else
            raise "title does not exist"
        end
    end

    def size
        employees.length
    end

    def pay_employee(employee)
        payment = self.salaries[employee.title]
        raise "not enough funding" if payment > @funding

        employee.pay(payment)
        @funding -= payment
    end

    def payday
        employees.each {|employee| self.pay_employee(employee)}
    end

    def average_salary
        sum = 0
        @employees.each { |employee| sum += salaries[employee.title] }
        sum / @employees.length
    end

    def close
        @employees = []
        @funding = 0
    end

    def acquire(created_startup)
        @funding += created_startup.funding

        created_startup.salaries.each do |title, amount|
            if !@salaries.has_key?(title)
                @salaries[title] = amount
            end
        end

        @employees = @employees + created_startup.employees
        created_startup.close()
    end

end
