# to_roman method converts arabic numerals into roman numerals
class Fixnum
  ROMAN_SYMBOLS = { ones: 'IVX', tens: 'XLC',
                    hundreds: 'CDM', thousands: 'M' }.freeze

  def to_roman
    roman_num = ''
    thousands = self / 1000
    hundreds = self % 1000 / 100
    tens = self % 100 / 10
    ones = self % 10 / 1
    push_roman_symbols(roman_num, thousands, :thousands) if thousands > 0
    push_roman_symbols(roman_num, hundreds, :hundreds) if hundreds > 0
    push_roman_symbols(roman_num, tens, :tens) if tens > 0
    push_roman_symbols(roman_num, ones, :ones) if ones > 0
    roman_num
  end

  private

  def push_roman_symbols(roman_num, num, key)
    values  = ROMAN_SYMBOLS[key]
    symbols = determine_roman_symbols(num, values)
    roman_num << symbols
  end

  def determine_roman_symbols(num, values)
    case num
    when 1...4 then values[0] * num
    when 4     then values[0] + values[1]
    when 5     then values[1]
    when 6...9 then values[1] + values[0] * (num - 5)
    when 9     then values[0] + values[2]
    end
  end
end
