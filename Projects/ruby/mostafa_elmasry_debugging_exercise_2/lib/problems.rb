# Run `bundle exec rspec` and satisy the specs.
# You should implement your methods in this file.
# Feel free to use the debugger when you get stuck.
def prime?(num)
    return false if num < 2 
    (2...num).none? {|e| num % e ==0}
end

def largest_prime_factor(num)
    num.downto(2) { |e| return e if num % e ==0 && prime?(e)}
end

def unique_chars?(string)
    arr=[]
    string.each_char do |char|
        return false if arr.include?(char)
        arr << char
    end

    true
end

def dupe_indices(array)
    hash= Hash.new{|k,v| k[v] =[]}
    array.each_with_index { |ele, i| hash[ele] << i }
    hash.select { |ele, hash| hash.length > 1 }
end

def ana_array(arr_1, arr_2)
    count_1 = total_count(arr_1)
    count_2 = total_count(arr_2)
    count_1 == count_2

end

def total_count(arr)
    count = Hash.new(0)

    arr.each { |ele| count[ele] += 1 }

    count
end