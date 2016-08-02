# Atbash class provides a set of class methods for encoding with Atbash cipher.
class Atbash
  FIRSTS = [*'a'..'m'].freeze
  LASTS = [*'n'..'z'].freeze
  PAIRS = FIRSTS.zip(LASTS.reverse)

  def self.encode(text)
    raise ArgumentError unless text.is_a? String
    chars = cleanup(text).chars
    encoded_text = encode_characters(chars)
    format_text(encoded_text)
  end

  def self.cleanup(text)
    text.downcase.delete('^a-z0-9')
  end

  def self.encode_characters(chars)
    chars.each_with_object('') do |char, encoded_chars|
      encoded_char = nil
      PAIRS.each do |pair|
        next unless pair.include?(char)
        encoded_char = pair.first == char ? pair.last : pair.first
      end
      encoded_char = char if encoded_char.nil?
      encoded_chars << encoded_char
    end
  end

  def self.format_text(text)
    index = 0
    result = []
    while index < text.length
      result << text.slice(index, 5) << ' '
      index += 5
    end
    result.join.strip
  end

  private_class_method :cleanup, :encode_characters, :format_text
end
