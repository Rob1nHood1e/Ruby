def last_digit(x,q=10)
  x % q
end

def digits_sum(x,q=10)
  res = 0
  while x > 0
    res += last_digit(x,q)
    x /= q
  end
  res
end

num = ARGV[0].to_i
puts digits_sum(num)