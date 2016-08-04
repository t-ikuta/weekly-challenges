# Atbash class provides a set of class methods for encoding with Atbash cipher.
class Atbash
  class << self
    def encode(text)
      raise ArgumentError unless text.is_a? String
      chars = text.downcase.scan(/[0-9a-z]/)
      encoded_text = encode_characters(chars)
      format_text(encoded_text)
    end

    private

    def encode_characters(chars)
      chars.each_with_object('') do |char, encoded_chars|
        encoded_char = (char =~ /[a-z]/) ? encode_character(char) : char
        encoded_chars << encoded_char
      end
    end

    def encode_character(char)
      n = char.ord - 97
      (97 + (25 - n) % 26).chr
    end

    def format_text(text)
      index = 0
      result = ''
      loop do
        result << text[index, 5] << ' '
        text = text[(index + 5)..-1]
        break result.strip if text.nil?
      end
    end
  end
end
