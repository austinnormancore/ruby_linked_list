class Node
	attr_accessor :value, :next_node

	def initialize(value = nil, next_node = nil)
		@value = value
		@next_node = next_node
	end
end

class LinkedList
	attr_accessor :list

	def initialize
		@list = []
	end

	def append(value)
		new_node = Node.new(value)
		last_node = @list[@list.length - 1]

		unless last_node.nil?
			last_node.next_node = new_node
		end
		@list << new_node
	end

	def prepend(value)
		new_node = Node.new(value, @list[0])
		@list.unshift(new_node)
	end

	def size
		return @list.length
	end

	def head
		return @list[0].value
	end

	def tail
		return @list[@list.length - 1].value
	end

	def at(index)
		return @list[index].value
	end

	def pop
		@list.pop()
		@list[-1].next_node = nil
	end

	def contains?(value)
		@list.each do |item|
			return true if item.value == value
		end
		false
	end

	def find(value)
		@list.each_with_index do |item, index|
			return index if item.value == value
		end
		return nil
	end

	def to_s
		@list.each do |item|
			print "( #{item.value} ) -> "
		end
		print "nil"
	end
end
