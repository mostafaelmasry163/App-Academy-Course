 def all_words_capitalized?(arr)
    arr.all? {|word| word.capitalize == word}
 end

 def no_valid_url?(string)
      valid_endings = [".com", ".net", ".io", ".org"]
    string.none? do |url|
        valid_endings.any? { |ending| url.end_with?(ending) }
    end
 end

 def any_passing_students?(studs)
    studs.any? do |stud|
        avg = stud[:grades].sum / (stud[:grades].length * 1.0)
        avg >= 75
    end
 end