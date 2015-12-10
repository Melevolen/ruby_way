puts "First(a): "
a = gets.chomp.to_f
puts "Second(b): "
b = gets.chomp.to_f
puts "Third(c): "
c = gets.chomp.to_f

d = b**2 - 4*a*c

if d > 0 
	x1 = (-b + Math.sqrt(d))/(2*a)
	x2 = (-b - Math.sqrt(d))/(2*a)
	puts "We have two roots: #{x1} and #{x2}"
	puts "Our D = #{d}"
elsif d == 0
	x = (-b)/(2*a)
	puts "We have one root: #{x}"
	puts "Our D = #{d}"
elsif d < 0
	puts "Our D = #{d} so... We don't have any roots."
end