 def partition(arr, num)
    less_arr=[]
    more_arr=[]
    arr.each do |el|
        if el>= num
            more_arr << el
        else
            less_arr << el
        end
    end


    [less_arr, more_arr]
 end

 def merge(hash_1, hash_2)

    merged = {}
  hash_1.each { |k, v| merged[k] = v }
  hash_2.each { |k, v| merged[k] = v }
  merged

 end

 def censor(hash, array)
    vowels = "aeiouAEIOU"
    
    

    new_words = hash.split(" ").map do |word|
        if array.include?(word.downcase)
            new_word = ""
            word.each_char do |char|
                if vowels.include?(char)
                 new_word += "*"
                 else
                 new_word += char
                end
            end

            new_word
         else
            word
         end
    end

new_words.join(" ")
 end

 def power_of_two?(number)

    pro=1

    while pro < number
        pro *=2
    end

    pro ==number

 end