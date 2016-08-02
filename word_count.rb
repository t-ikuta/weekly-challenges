# Counts the words composed of alphanumeric characters.
class Phrase
  attr_reader :words

  def initialize(words)
    @words = words.downcase.scan(/\b[\w']+\b/)
  end

  def word_count
    words.each_with_object(Hash.new(0)) do |word, counts|
      counts[word] += 1
    end
  end
end
