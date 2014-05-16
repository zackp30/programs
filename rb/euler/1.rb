@dat_array = []

(1..999).each do |n|
  @dat_array << n if n % 3 == 0
  @dat_array << n if n % 5 == 0
end

@sum = 0
@dat_array.uniq.each { |n| @sum += n }

puts @sum
