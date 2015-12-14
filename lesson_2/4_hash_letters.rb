arr = ["a".."z"]
vowels = ['a','e','i','o','u']
i = 1
letters = Hash.new
for let in ("a".."z") do 
	letters[let] = i if vowels.include?(let)
	i += 1
end
puts letters # Для проверки.
