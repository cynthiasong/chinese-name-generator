# encoding: utf-8
# Chinese Name Generator:
# to generate pretty, dulcet and elegant Chinese names (female only for now)

# generate one required name
def name_gen(two_chars)
	
	# fn stands for "family name"  (姓)

	fn_ping = ["黎", "卓", "苏", "林", "蓝", "童", "茹", "柯"]
	fn_ze   = ["洛", "冷", "木", "易", "路", "段", "牧", "叶"]

	# gn   stands for "given name" (名)
	# yinp stands for "yinping"    (阴平)
	# yang stands for "yangping"   (阳平)
	# shsh stands for "shangsheng" (上声) 
	# qush stands for "qusheng"    (去声)

	gn_yinp = ["潇", "溦", "轩", "倾", "殊", "汐"]
	gn_yang = ["言", "唯", "茗", "瑶", "洄", "宜"]
	gn_shsh = ["语", "芷", "子", "宛", "萦", "蓼"]
	gn_qush = ["绰", "彦", "黛", "茜", "漫", "沫"]

	fn_list = fn_ping + fn_ze

	gn_ping = gn_yinp + gn_yang
	gn_ze   = gn_shsh + gn_qush
	gn_list = gn_ping + gn_ze

	fn = fn_list.sample

	if two_chars
		gn = gn_gen_one_char(fn, fn_ping, gn_ping, gn_ze) 
	else
		gn = gn_gen_two_char(fn, fn_ping, gn_yinp, gn_yang, gn_shsh, gn_qush, gn_ping, gn_ze, gn_list)
	end

	name = fn + gn

end

# generate one character as the given name
def gn_gen_one_char(fn, fn_ping, gn_ping, gn_ze)
	gn = fn_ping.include?(fn) ? gn_ze.sample : gn_ping.sample
end

# generate two different characters and concatenate them as the given name
def gn_gen_two_char(fn, fn_ping, gn_yinp, gn_yang, gn_shsh, gn_qush, gn_ping, gn_ze, gn_list)
	if fn_ping.include?(fn) 		
		gn_first  = gn_ze.sample		
		gn_second = gn_shsh.include?(gn_first) ? gn_yinp.sample : gn_ping.sample

	else		
		gn_first = gn_list.sample

		case 
		when gn_yinp.include?(gn_first)				
			# to avoid possible repetitions
			options = gn_ping.sample(2)			
			gn_second = options[0] == gn_first ? options[1] : options[0]
		when gn_yang.include?(gn_first)			
			gn_second = gn_yinp.sample			
		when gn_shsh.include?(gn_first)			
			gn_second = gn_yinp.sample			
		else			
			gn_second = gn_ping.sample			
		end
	end

	gn = gn_first + gn_second
end

# generate all required names
def gen_many (two_chars,n)
	n.times { puts name_gen(two_chars) }
end

# let the user choose if two-character names are wanted
def two_chars?
	while true
		puts "Please enter 'a' for two-character names, 'b' for three-character names: "
		case gets.chomp.downcase
		when 'a' then return true
		when 'b' then return false
		else puts "Oops! Please choose a or b! "
		end
	end
end

# let the user choose how many names to generate
def how_many
	while true
		puts "How many names do you want? Please enter a number: "
		n = gets.chomp.to_i
		return n if n > 0		
		puts "Oops! Please enter an integer more than 0! "
	end
end

# let's do the job now
gen_many(two_chars?, how_many)
puts "Thank U! Hope you like the names!"












