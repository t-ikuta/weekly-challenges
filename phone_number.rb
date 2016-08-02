# Cleans up the user-entered phone numbers
class PhoneNumber
  ERROR_NUMBER = '0000000000'.freeze

  attr_reader :valid_number

  def initialize(number)
    @valid_number = format(number)
  end

  def number
    valid_number
  end

  def format(number)
    return ERROR_NUMBER if alphabets?(number)
    number = number.delete('^0-9')
    return ERROR_NUMBER if invalid?(number)
    number.length == 11 ? number.slice(1, 10) : number
  end

  def area_code
    number.slice(0, 3)
  end

  def to_s
    "(#{area_code}) #{number.slice(3, 3)}-#{number.slice(6, 4)}"
  end

  private

  def invalid?(number)
    number.length > 11 ||
      number.length < 10 ||
      (number.length == 11 && number[0] != '1')
  end

  def alphabets?(number)
    number.downcase =~ /[a-z]/
  end
end
