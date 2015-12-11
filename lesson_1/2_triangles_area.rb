#Площадь треугольника
# a - base
# h - height
# 1/2*a*h
puts "Input base: "
a = gets.chomp.to_f
puts "Input height: "
h = gets.chomp.to_f
area = 1.0/2 * a * h 
puts "Area is #{area}"