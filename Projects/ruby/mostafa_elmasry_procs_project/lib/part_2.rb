 def reverser(str, &prc)
    prc.call(str.reverse)
 end

 def word_changer(str, &prc)
    new_words=[]
    words=str.split(" ")
    words.each {|word| new_words << prc.call(word) }
    new_words.join(" ")
 end

 def greater_proc_value(number, prc_1, prc_2)
    if prc_1.call(number) > prc_2.call(number)
        return prc_1.call(number)
    else
        return prc_2.call(number)
    end

 end

 def and_selector(arr, prc_1, prc_2)
    new_arr=[]
    arr.each do |num|
        if prc_1.call(num) && prc_2.call(num)
            new_arr << num
        end
    end
    new_arr
 end

 def alternating_mapper(arr, prc_1,prc_2)
    new_arr=[]
    arr.each_with_index do |num, i|
        if i.even?
            new_arr << prc_1.call(num)
        else
            new_arr << prc_2.call(num)
        end
    end
    new_arr
 end