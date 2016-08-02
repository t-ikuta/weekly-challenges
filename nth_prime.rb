# Returns nth prime number
class Prime
  def self.nth(term)
    raise ArgumentError if term <= 0
    @primes = [2]
    num = 3
    while @primes.size < term
      @primes << num if prime?(num)
      num += 2
    end
    @primes.last
  end

  def self.prime?(num)
    @primes.each do |prime|
      return false if num % prime == 0
      break true if prime > Math.sqrt(num)
    end
  end
end
