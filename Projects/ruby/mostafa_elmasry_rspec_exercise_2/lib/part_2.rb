def palindrome?(sentan)
    sentan.each_char.with_index do |char, i|
        if sentan[i] != sentan[-i - 1]
            return false
        end
    end
    return true
end

def substrings(str)
    new_str = []

  (0...str.length).each do |start|
    (start...str.length).each do |ended|
      new_str << str[start..ended]
    end
  end

  new_str
end

def palindrome_substrings(strings)
    substrings(strings).select { |substr| palindrome?(substr) && substr.length > 1 }
end