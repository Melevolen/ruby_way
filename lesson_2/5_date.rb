# t = Time.now
# puts t 
# puts t.yday # 348

monthes_days = {'January' => 31, 'February' => 28, 'March' => 31, 'April' => 30, 'May' => 31, 'June' => 30, 'July' => 31, 'August' => 31, 'September' => 30, 'October' => 31, 'November' => 30, 'December' => 31}
days = monthes_days.values

puts 'Input year: '
year = gets.chomp.to_i

puts 'Input month number: '
month = gets.chomp.to_i

puts 'Input date: '
date = gets.chomp.to_i

td = date
if month > 1 
	if year % 4 != 0
		for x in 1...month
			td += days[x-1]
		end
	else
		days[1] = 29
		for x in 1...month
			td += days[x-1]
		end
	end		
end

puts td # Today is day number...

