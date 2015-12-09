#Ideal weight
# Идеальный вес. Программа запрашивает имя и рост и выводит идеальный вес по формуле <рост> - 110,
#  после чего выводит результат пользователю на экран с обращением по имени. 
#  Если идеальный вес получается отрицательным, то выводится строка "Ваш вес уже оптимальный"

puts "Type your name: "
name = gets.chomp
puts "#{name}, pls, type your height: "
height = gets.chomp.to_i
ideal_weight = height - 110
if ideal_weight >= 0
	puts "#{name}, ideal weight for you is #{ideal_weight}"
else
	puts "#{name}! Ваш вес уже оптимальный"
end