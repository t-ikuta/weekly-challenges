# Determines whether a number is pefect, deficient or abundant
class PerfectNumber
  def self.classify(num)
    raise RuntimeError unless positive_integer?(num)
    case sum_of_divisors(num)
    when 0...num then 'deficient'
    when num     then 'perfect'
    else              'abundant'
    end
  end

  def self.sum_of_divisors(num)
    [*1...num].select { |candidate| num % candidate == 0 }.reduce(:+)
  end

  def self.positive_integer?(num)
    num != 0 && num.to_s.match(/\A+?\d+\z/)
  end

  private_class_method :sum_of_divisors, :positive_integer?
end
