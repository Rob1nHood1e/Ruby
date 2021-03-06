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

def digits_mult(x,q=10)
  res = 1
  while x > 0
    res *= last_digit(x,q)
    x /= q
  end
  res
end

def max_digit(x,q=10)
  max = last_digit(x,q)
  x /= q
  while x > 0
    if max < last_digit(x,q)
      max = last_digit(x,q)
    end
    x /= q
  end
  max
end

def min_digit(x,q=10)
  min = last_digit(x,q)
  x /= q
  while x > 0
    if min > last_digit(x,q)
      min = last_digit(x,q)
    end
    x /= q
  end
  min
end

def div_not_three(x)
  count = 0
  (1..x).each{|i| if (x % i == 0 &&  i % 3 != 0) then count += 1 end}
  count
end

def min_odd_digit(x,q=10)
  min = 10
  while x > 0
    if last_digit(x,q).odd?
      if last_digit(x,q) < min
        min = last_digit(x,q)
      end
    end
    x /= q
  end
  min
end

num = ARGV[0].to_i
puts digits_sum(num)
puts digits_mult(num)
puts max_digit(num)
puts min_digit(num)
puts div_not_three(num)
puts min_odd_digit(num)
