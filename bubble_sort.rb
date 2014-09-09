def bubble_sort(array)
	length = array.length
	begin
		swapped = false
		for i in 1..length - 1
			if array[i - 1] > array[i]
				array[i - 1], array[i] = array[i], array[i - 1]
				swapped = true
			end
		end
		length -= 1
	end until !swapped
	return array
end

def bubble_sort_by(array)
	length = array.length
	begin
		swapped = false
		for i in 1..length - 1
			if yield(array[i - 1], array[i]) < 0
				array[i - 1], array[i] = array[i], array[i - 1]
				swapped = true
			end
		end
		length -= 1
	end until !swapped
	return array
end

p bubble_sort([4,3,78,2,0,2])
p bubble_sort_by(["hi","hello","hey"]) { |left,right| right.length - left.length }