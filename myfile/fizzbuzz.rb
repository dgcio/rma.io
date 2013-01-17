def is_multiple_of_3(number)
  return number = number.to_f / 3
end

def is_multiple_of_5(number)
  return number = number * 5
end

0.upto(100) do |num| 

  print "#{is_multiple_of_3(num)}\n"

  #if is_multiple_of_3(num)
  #  print "#{num} - fizz\n"
  #elsif is_multiple_of_5(num)
  #  print "#{num} - buzz\n"
  #elsif is_multiple_of_5(num) && is_multiple_of_3(num)
  # print "#{num} - fizzbuzz\n"
  #else
  #  p num
  #end 

end