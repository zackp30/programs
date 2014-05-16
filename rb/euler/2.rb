max = 40
@fib = []
@last_result = 1
(1..max).each do |n|
  @fib << n + @last_result
  @last_result = @fib[n]
end
puts @fib
