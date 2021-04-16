 def hipsterfy(word)
    vowels = "aeiou"

  i = word.length - 1

    while i >= 0
    if vowels.include?(word[i])
      return word[0...i] + word[i+1..-1]
    end

    i -= 1
    end
    word
 end

 def vowel_counts(str)
    counts = Hash.new(0)
  vowels = "aeiou"

  str.downcase.each_char do |char|
    if vowels.include?(char)
      counts[char] += 1
    end
  end

  counts
 end

 def caesar_cipher(msg, num)
    alphabet = ("a".."z").to_a
  new_message = ""

  msg.each_char do |char|
    old_idx = alphabet.index(char)
    if old_idx == nil
      new_message += char
    else
      new_idx = old_idx + num
      new_message += alphabet[new_idx % 26]
    end
  end

  new_message
 end