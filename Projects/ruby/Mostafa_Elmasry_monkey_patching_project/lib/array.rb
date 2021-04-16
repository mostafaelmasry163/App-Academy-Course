# Monkey-Patch Ruby's existing Array class to add your own custom methods
class Array

   def span
    largest = self.max()
    smallest = self.min()
        if largest != nil && smallest != nil
            return largest - smallest
        else
            return nil
        end
   end

   def average
    if self.length == 0
        return nil
    else
        self.inject(&:+) / self.length.to_f
    end
   end

   def median
    if self.length ==0 
        return nil
    end
    sorted = self.sort()
    arr_length = self.length
    if arr_length % 2 == 1
        sorted[arr_length/2]
    else
        ((sorted[arr_length/2] + sorted[(arr_length/2) -1])) / 2.0
    end       
   end

   def counts
    count_hash = Hash.new(0)
    self.each { |ele| count_hash[ele] += 1 }
    count_hash
   end

   def my_count(val)
    counter= 0
    self.each {|ele| counter += 1 if ele == val}
    counter
   end

   def my_index(arg)
    self.each_with_index { |ele, i| return i if ele == arg}
    nil
   end

   def my_uniq
    elements={}
    self.each { |ele| elements[ele]= true}
    elements.keys
   end

   def my_transpose
    transposed= []
    self.each_with_index do |ele_1, i1|
        row = []

        self.each_with_index do |ele_2, i2|
            row << self[i2][i1]
        end
        
        transposed << row
    end
    transposed
   end

end
