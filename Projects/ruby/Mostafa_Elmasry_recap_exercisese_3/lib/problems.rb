#General Problems

def no_dupes?(arr)
    new_arr=Hash.new(0)
    arr.each {|el| new_arr[el] +=1}
    new_arr.keys.select {|el| new_arr[el] ==1}
end

#Examples

# p no_dupes?([1, 1, 2, 1, 3, 2, 4])         # => [3, 4]
# p no_dupes?(['x', 'x', 'y', 'z', 'z'])     # => ['y']
# p no_dupes?([true, true, true])            # => []

def no_consecutive_repeats?(arr)
    (0...arr.length).each do |i|
        return false if arr[i] == arr[i+1]
    end
    true
end

# Examples
# p no_consecutive_repeats?(['cat', 'dog', 'mouse', 'dog'])     # => true
# p no_consecutive_repeats?(['cat', 'dog', 'dog', 'mouse'])     # => false
# p no_consecutive_repeats?([10, 42, 3, 7, 10, 3])              # => true
# p no_consecutive_repeats?([10, 42, 3, 3, 10, 3])              # => false
# p no_consecutive_repeats?(['x'])                              # => true

def char_indices(str)
    result = Hash.new {|k,v| k[v]=[]}
    str.each_char.with_index { |char,i| result[char] << i}
    result
end

# Examples
# p char_indices('mississippi')   # => {"m"=>[0], "i"=>[1, 4, 7, 10], "s"=>[2, 3, 5, 6], "p"=>[8, 9]}
# p char_indices('classroom')     # => {"c"=>[0], "l"=>[1], "a"=>[2], "s"=>[3, 4], "r"=>[5], "o"=>[6, 7], "m"=>[8]}

def longest_streak(str)
    old_streak =""
    new_streak =""
    (0...str.length).each do |i|
        if str[i] == str[i-1] || i == 0
            old_streak += str[i]
        else
            old_streak = str[i]
        end
        new_streak = old_streak if old_streak.length >= new_streak.length
    end

    new_streak
end

# Examples
# p longest_streak('a')           # => 'a'
# p longest_streak('accccbbb')    # => 'cccc'
# p longest_streak('aaaxyyyyyzz') # => 'yyyyy'
# p longest_streak('aaabbb')      # => 'bbb'
# p longest_streak('abc')         # => 'c'

def prime_factors(num)
    (2..num).select {|n| num%n ==0 && prime?(n)} 
end

def prime?(num)
    return false if num < 2
    (2...num).none? {|n| num % n ==0}
end

def bi_prime?(num)
    arr = prime_factors(num)
    arr.any? do |x|
        y= num / x * 1.0
        arr.include?(y)
    end
end

# Examples
# p bi_prime?(14)   # => true
# p bi_prime?(22)   # => true
# p bi_prime?(25)   # => true
# p bi_prime?(94)   # => true
# p bi_prime?(24)   # => false
# p bi_prime?(64)   # => false

def vigenere_cipher(msg, arr)
    alphabet = ("a".."z").to_a
    new_msg = ""
    msg.each_char.with_index do |char, i|
        pos= alphabet.index(char)
        key = arr[i % arr.length]
        new_pos = (pos + key) % alphabet.length
        new_msg += alphabet[new_pos]
    end
    new_msg
end

# Examples
# p vigenere_cipher("toerrishuman", [1])        # => "upfssjtivnbo"
# p vigenere_cipher("toerrishuman", [1, 2])     # => "uqftsktjvobp"
# p vigenere_cipher("toerrishuman", [1, 2, 3])  # => "uqhstltjxncq"
# p vigenere_cipher("zebra", [3, 0])            # => "ceerd"
# p vigenere_cipher("yawn", [5, 1])             # => "dbbo"

def vowel_rotate(str)
    new_str = str[0..-1]
    vowels = 'aeiou'

    vowel_idxs = (0...str.length).select { |i| vowels.include?(str[i]) }
    rotated_vowel_idxs = vowel_idxs.rotate(-1)

    vowel_idxs.each_with_index do |vowel_idx, i|
        new_vowel = str[rotated_vowel_idxs[i]]
        new_str[vowel_idx] = new_vowel
    end

    new_str
end

# Examples

# p vowel_rotate('computer')      # => "cempotur"
# p vowel_rotate('oranges')       # => "erongas"
# p vowel_rotate('headphones')    # => "heedphanos"
# p vowel_rotate('bootcamp')      # => "baotcomp"
# p vowel_rotate('awesome')       # => "ewasemo"

#Proc Problem

class String
    def select(&prc)
        return "" if prc.nil?
        result = ""
        self.each_char do |char|
            result += char if prc.call(char)
        end
        result
    end

    def map!(&prc)
        self.each_char.with_index do |char, i|
            self[i] = prc.call(char,i)
        end
    end

end

# # select Examples
# p "app academy".select { |ch| !"aeiou".include?(ch) }   # => "pp cdmy"
# p "HELLOworld".select { |ch| ch == ch.upcase }          # => "HELLO"
# p "HELLOworld".select          # => ""

# # map! Examples
# word_1 = "Lovelace"
# word_1.map! do |ch| 
#     if ch == 'e'
#         '3'
#     elsif ch == 'a'
#         '4'
#     else
#         ch
#     end
# end
# p word_1        # => "Lov3l4c3"

# word_2 = "Dijkstra"
# word_2.map! do |ch, i|
#     if i.even?
#         ch.upcase
#     else
#         ch.downcase
#     end
# end
# p word_2        # => "DiJkStRa"

#Recursion Problems

def multiply(x,y)
    return 0 if y == 0
    if y < 0
        -(x + multiply(x, (-y) - 1))
    else
        x + multiply(x, y - 1)
    end
end

# # Examples
# p multiply(3, 5)        # => 15
# p multiply(5, 3)        # => 15
# p multiply(2, 4)        # => 8
# p multiply(0, 10)       # => 0
# p multiply(-3, -6)      # => 18
# p multiply(3, -6)       # => -18
# p multiply(-3, 6)       # => -18

def lucas_sequence(n)
    return [] if n == 0
    return [2] if n == 1
    return [2,1] if n== 2

    result = lucas_sequence(n-1)
    result << result[-1] + result[-2]
    result
end

# # Examples
# p lucas_sequence(0)   # => []
# p lucas_sequence(1)   # => [2]    
# p lucas_sequence(2)   # => [2, 1]
# p lucas_sequence(3)   # => [2, 1, 3]
# p lucas_sequence(6)   # => [2, 1, 3, 4, 7, 11]
# p lucas_sequence(8)   # => [2, 1, 3, 4, 7, 11, 18, 29]

def prime_factorization(n)
    (2...n).each do |num|
        if n % num == 0
            othernum = n / num
            return [*prime_factorization(num),*prime_factorization(othernum)]
        end
    end
    [n]
end

# # Examples
# p prime_factorization(12)     # => [2, 2, 3]
# p prime_factorization(24)     # => [2, 2, 2, 3]
# p prime_factorization(25)     # => [5, 5]
# p prime_factorization(60)     # => [2, 2, 3, 5]
# p prime_factorization(7)      # => [7]
# p prime_factorization(11)     # => [11]
# p prime_factorization(2017)   # => [2017]