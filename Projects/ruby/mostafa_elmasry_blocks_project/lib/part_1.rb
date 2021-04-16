def select_even_nums(arr)
    arr.select(&:even?)
end

def reject_puppies(hash)
    hash.reject {|puppy| puppy["age"] < 3 }
end

def count_positive_subarrays(array)
    array.count { |sub_array| sub_array.sum > 0 }
end

def aba_translate(string)
  vowels = "aeiou"
  new_word = ""

    string.each_char do |char|
        if vowels.include?(char)
            new_word += char + "b" + char
        else
            new_word += char
        end
    end

  new_word
end

def aba_array(str_arr)
    str_arr.map { |word| aba_translate(word) }
end