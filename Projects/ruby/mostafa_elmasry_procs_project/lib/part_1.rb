 def my_map(arr, &prcs)
    new_arr=[]

    arr.each do |num|
        new_arr << prcs.call(num)
    end

    new_arr
 end

 def my_select(arr, &prc)
    new_arr=[]

    arr.each do |num|
        if prc.call(num)
            new_arr << num
        end
    end

    new_arr
 end

 def my_count(arr, &prcss)
    count=0
    
    arr.each do |num|
        if prcss.call(num)
            count +=1
        end
    end

    count
 end

 def my_any?(arr, &prcs)
    arr.each do |num|
        if prcs.call(num)
            return true
        end
    end
    false
 end

 def my_all?(arr, &prc)
    arr.each do |num|
        if !prc.call(num)
            return false
        end

    end
    true
 end

 def my_none?(arr, &prc)
    arr.each do |num|
        if prc.call(num)
            return false
        end
    end
    true
 end