class Employee
 attr_reader :title, :name

 def initialize(name, title)
    @name = name
    @title = title
    @earnings = 0
 end

def pay(salary)
@earnings += salary
end

end
