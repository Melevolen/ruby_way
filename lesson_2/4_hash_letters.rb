vowels = ['a','e','i','o','u']
i = 1
letters = Hash.new
# for let in ("a".."z") do 
# 	letters[let] = i if vowels.include?(let)
# 	i += 1
# end
("a".."z").each_with_index {|obj, ind| 
	
	letters[obj] = (ind + 1) if vowels.include?(obj)
} 

puts letters # Для проверки.
	