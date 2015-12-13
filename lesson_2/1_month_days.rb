#Date.civil(2015, 01, -1)



year = Hash.new 
year['January'] = 31
year['February'] = 28 # т.к. нас интересуют только 30ти дневные мясяцы, то и проверка на високосный год не актуальна.
year['March'] = 31
year['April'] = 30
year['May'] = 31
year['June'] = 30
year['July'] = 31
year['August'] = 31
year['September'] = 30
year['October'] = 31
year['November'] = 30
year['December'] = 31

year.each do |k, v|
	puts k if v == 30
end