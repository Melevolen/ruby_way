#right triangle

puts "Type side 1: "
side1 = gets.chomp.to_i
puts "Type side 2: "
side2 = gets.chomp.to_i
puts "Type side 3: "
side3 = gets.chomp.to_i

#Проверяем прямоугольный/равнобедренный:
if side1 > side2 && side1 >side3
	puts "Треугольник прямоугольный" if side1**2 == side2**2 + side3**2
	puts "Треугольник равнобедренный" if side2 == side3
elsif side2 > side1 && side2 > side3
	puts "Треугольник прямоугольный" if side2**2 == side1**2 + side3**2
	puts "Треугольник равнобедренный" if side1 == side3	
elsif side3 > side1 && side3 > side2
	puts "Треугольник прямоугольный" if side3**2 == side1**2 + side2**2
	puts "Треугольник равнобедренный" if side1 == side2	
elsif side1 == side2 && side1 == side3
	puts "Треугольник равносторонний!"
end