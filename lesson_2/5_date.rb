# t = Time.now
# puts t 
# puts t.yday # 348

# monthes_days = {'January' => 31, 'February' => 28, 'March' => 31, 'April' => 30, 'May' => 31, 'June' => 30, 'July' => 31, 'August' => 31, 'September' => 30, 'October' => 31, 'November' => 30, 'December' => 31}

days = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]

puts 'Input year: '
year = gets.chomp.to_i

puts 'Input month number: '
month = gets.chomp.to_i

puts 'Input date: '
date = gets.chomp.to_i

# td = date
# if month > 1 
# 	if year % 4 != 0
# 		for x in 1...month
# 			td += days[x-1]
# 		end
# 	else
# 		days[1] = 29
# 		for x in 1...month
# 			td += days[x-1]
# 		end
# 	end		
# end

if year % 4 == 0 && (year % 100 != 0 || year % 400 == 0) 
	days[1] = 29
end
for x in 1...month
	date += days[x-1]
end
puts date # Today is day number...
