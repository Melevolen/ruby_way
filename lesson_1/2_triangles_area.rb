#Площадь треугольника
# a - base
# h - height
# 1/2*a*h
puts "Input base: "
a = gets.chomp.to_i
puts "Input height: "
h = gets.chomp.to_i
area = 1.0/2 * a * h 
puts "Area is #{area}"