all = Hash.new
name = "nothing"
all_money = 0
while name != "stop"
	puts 'Name: '
	name = gets.chomp.to_s
	if name != "stop"
		puts 'Price for one: '
		price = gets.chomp.to_f
		puts 'Count of goods: '
		count = gets.chomp.to_f
	all[name] = {'price' => price, 'count' => count} 
	end 
end 

all.each {|k, v| puts "You want #{k} and it will be #{v['price']*v['count']}"}

all.each_value do |v|
	 all_money = all_money + v['price']*v['count']
end
puts all 
puts '----------------------'
puts all_money
