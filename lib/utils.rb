class Utils
  def self.factorial(n)
    raise "'#{n}' must be positive Natural number." if !n.class.eql?(Fixnum) or n < 0
    n > 1 ? 1.upto(n).inject(:*) : 1
  end

  def self.factorial_summary(n)
    result = { number: n, factorial: factorial(n), zeros_at_right: 0 }

    exp = 1
    while not (power = 5**exp) > n do
      result[:zeros_at_right] += n / power
      exp += 1
    end

    result
  end
end
