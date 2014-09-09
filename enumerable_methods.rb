module Enumerable
	def my_each
		for i in 0...(self.length)
			yield(self[i])
		end
	end
	
	def my_each_with_index
		for i in 0...(self.length)
			yield(self[i], i)
		end
	end
	
	def my_select
		array = []
		return self unless block_given?
		self.my_each do |i|
			array << i if yield(i)
		end
		array
	end
	
	def my_all?
		if block_given?
			self.my_each { |i| return false unless yield(i) }
		else
			self.my_each { |i| return false unless i }
		end
		true
	end
	
	def my_any?
		if block_given?
			self.my_each { |i| return true if yield(i) }
		else
			self.my_each { |i| return true if i }
		end
		false
	end
	
	def my_none?
		if block_given?
			self.my_each { |i| return false if yield(i) }
		else
			self.my_each { |i| return false if i }
		end
		true
	end
	
	def my_count(arg = nil)
		num = 0
		if arg
			self.my_each { |i| num += 1 if i == arg }
			return num
		elsif block_given?
			self.my_each { |i| num += 1 if yield(i) }
			return num
		else
			return self.length
		end
	end
	
	def my_map(proc = nil)
		array = []
		return self unless proc
		if proc && !block_given?
			self.my_each { |i| array << proc.call(i) }
		elsif proc && block_given?
			self.my_each { |i| array << yield(proc.call(i)) }
		end
		array
	end
	
	def my_inject(arg = 0)
		self.my_each { |i| arg = yield(arg, i) }
		arg
	end
end

def multiply_els(array)
	array.my_inject(1) { |product, i| product * i }
end