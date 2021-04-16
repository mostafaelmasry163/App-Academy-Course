 def average(num_1, num_2)
    (num_1 + num_2) /2.0
 end

 def average_array(arr)
    avg=0.0
    arr.each do |num|
        avg+= num
    end
    return avg / arr.length
 end

 def repeat(str, num)
    str*num
 end

 def yell(str)
   str.upcase + "!"
 end

 def alternating_case(sentence)
    words = sentence.split(" ")

  new_words = words.map.with_index do |word, i|
    if i.even?
      word.upcase
    else
      word.downcase
    end
  end

  new_words.join(" ")

 end